# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo-git
pkgver=8.0.0.12.g8fb7672
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
md5sums=('SKIP'
         '03f9f990777fcd860374406accf9a227')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | tr - .|cut -c2-
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
