# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo-git
pkgver=7.0.0.370.gbe216cb
pkgrel=2
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
         'bcadd18eb752a95e4efc3f015e7a536d')

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
