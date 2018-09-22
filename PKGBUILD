# Maintainer: JP Cimalando <jp-dev inbox.ru>
pkgname=opn2bankeditor-git
_pkgname=OPN2BankEditor
pkgver=1.3.beta.r1.g6bad9cc
pkgrel=1
epoch=
pkgdesc="A small cross-platform editor of the OPN2 FM banks of different formats"
arch=('i686' 'x86_64')
url="https://github.com/Wohlstand/OPN2BankEditor"
license=('GPL3')
groups=()
depends=('qt5-base' 'qwt' 'jack' 'libpulse')
makedepends=()
checkdepends=()
optdepends=()
provides=("opn2bankeditor")
conflicts=("opn2bankeditor")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/Wohlstand/${_pkgname}.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git submodule update
}

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$_pkgname"
  make -C build install DESTDIR="$pkgdir"
}
