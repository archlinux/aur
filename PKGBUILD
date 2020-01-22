# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo-git
pkgver=9.0.r95.g72bb0d9
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('i686' 'x86_64')
url="https://github.com/blippy/neoleo"
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
license=('GPL')
depends=('ncurses')
makedepends=('git')
source=("git+$url.git" return_values.patch)
options=('!makeflags')
sha256sums=('SKIP'
            'a226af78cfd27541ef3ad4255b435667e412787f5b2cea8490cec93ad1929951')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' |tr - . | cut -c2-
}

prepare() {
  cd ${pkgname%-git}
  git apply "$srcdir"/return_values.patch
}

build() {
  cd ${pkgname%-git}
  autoreconf -iv
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
}
