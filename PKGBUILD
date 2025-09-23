# Maintainer: Nima Askarian <nimaaskarian.work@outlook.com>
pkgname=potato-c
pkgver=0.7.4
pkgrel=1
_gitname=potato-c
pkgdesc="A featureful, modular and fast pomodoro timer with server-client structure, written in C."
url="https://github.com/nimaaskarian/${_gitname}"

provides=(potctl potd potui)
makedepends=(ncurses)
arch=('x86_64')
license=('GPL3')
optdepends=(
  'libnotify: sending notifications on event'
  # AUR
  'herbe-git: sending notifications on event'
)

source=(
  "${pkgname}.tar.gz::https://github.com/nimaaskarian/${_gitname}/archive/refs/tags/${pkgver}.zip"
)

md5sums=('5fec93622fcc0567c8fe5031abb21fd6')
build () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make
}

package () {
  cd "${pkgname}-${pkgver/v/}" || exit
  make install DESTDIR="$pkgdir" PREFIX="/usr" CONFIG_DIR="$pkgdir/usr/share/$pkgname"
}
