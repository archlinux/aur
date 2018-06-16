# Maintainer: JP Cimalando <jp-dev inbox.ru>
pkgname=opl3bankeditor-git
_pkgname=OPL3BankEditor
pkgver=1.3.beta.r327.g1add5f4
pkgrel=1
epoch=
pkgdesc="A small cross-platform editor of the OPL3 FM banks of different formats"
arch=('i686' 'x86_64')
url="https://github.com/Wohlstand/OPL3BankEditor"
license=('GPL3')
groups=()
depends=('qt5-base' 'jack' 'libpulse')
makedepends=()
checkdepends=()
optdepends=()
provides=("opl3bankeditor")
conflicts=("opl3bankeditor")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/Wohlstand/${_pkgname}.git"
        'opl3_bank_editor.desktop')
noextract=()
md5sums=('SKIP'
         "8eddaea4568da3d1b441473951d64116")
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
