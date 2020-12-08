# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo-git
pkgver=10.0.r152.gb0d78af
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('i686' 'x86_64')
url="https://github.com/blippy/neoleo"
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
license=('GPL')
depends=('ncurses')
makedepends=('git')
source=("git+$url.git")
options=('!makeflags')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' |tr - . | cut -c2-
}
build() {
  cd ${pkgname%-git}
  autoreconf -iv
  LIBS+="-lstdc++fs"  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir/" install
}
