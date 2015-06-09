# Maintainer: xsmile <sascha_r a|t gmx d|o|t de>
_gitroot="https://github.com/LongSoft/UEFITool.git"
_gitname="UEFITool"
_gitbranch="master"
_elf="uefitool"
pkgname=uefitool-git
pkgver=r146.b9b5758
pkgrel=1
pkgdesc="UEFI firmware image viewer and editor"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://forums.mydigitallife.info/threads/48979-UEFITool-UEFI-firmware-image-viewer-and-editor"
license=('BSD')
depends=('qt5-base')
makedepends=('git' 'qt5-base')
provides=('uefitool')
conflicts=('uefitool')
source=("${_gitname}::git+${_gitroot}#branch=${_gitbranch}")
md5sums=('SKIP')
pkgver() {
  cd "${srcdir}/${_gitname}/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "${srcdir}/${_gitname}"
  qmake-qt5
  make
}
package() {
  cd "${srcdir}/${_gitname}"
  install -D -m755 "${_gitname}" "${pkgdir}/usr/bin/${_elf}"
}
