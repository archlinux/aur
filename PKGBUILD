#Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

pkgname=libmikmod-n64-git
pkgver=r7.2a3752b
pkgrel=1
pkgdesc="A portable sound library (Nintendo 64)"
arch=('any')
url="https://github.com/networkfusion/libmikmod"
license=('LGPL')
makedepends=('git' 'mips64-elf-gcc-stage1')
depends=('libdragon')
provides=('libmikmod-n64')
conflicts=('libmikmod-n64')
options=('!buildflags' '!strip')
source=("git://github.com/networkfusion/libmikmod.git" "makefile.diff")
sha256sums=('SKIP'
           'f074dc7855aa5338c41c17a86559ce6dbe9aa1109b5f7d5c88c9981d995b6a10')

pkgver() {
  cd libmikmod
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd libmikmod
  patch -p1 < "${srcdir}/makefile.diff"
}

build() {
  cd libmikmod/n64
  N64_INST=/usr make
}

package() {
  cd libmikmod/n64
  mkdir -p ${pkgdir}/usr/mips64-elf/{lib,include}
  make INSTALLDIR="${pkgdir}/usr" install
}
