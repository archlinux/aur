# Maintainer: Ewan Green <ewangreen95 at gmail dot com>
# Contributor: JP Cimalando <jp-dev at inbox dot ru>
pkgname=ptcollab-git
_pkgname=ptcollab
pkgver=0.4.3.r20.gdd2f630
pkgrel=1
epoch=
pkgdesc="Multiplayer music editor"
arch=('x86_64')
url="https://yuxshao.github.io/ptcollab/"
license=('MIT')
groups=()
depends=('qt5-base' 'rtmidi')
makedepends=('git' 'qt5-tools')
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
changelog=
source=("$_pkgname::git+https://github.com/yuxshao/ptcollab.git")
md5sums=('SKIP')
noextract=()
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$_pkgname"
  qmake ptcollab.pro CONFIG+=release PREFIX=/usr QMAKE_CXXFLAGS+='-D_FORTIFY_SOURCE=0'
  make -j1 qmake_all
  make
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
