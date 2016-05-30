# Maintainer: Philipp Joram <mail AT phijor DOT me>

_gitname=ctroller
pkgname=${_gitname}-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Use your 3DS as a gamepad on your Linux PC -- precompiled 3DS binaries"
arch=('x86_64')
url="https://github.com/phijor/ctroller"
license=('GPL3')
provides=('ctroller-git')
conflicts=('ctroller-git')
depends=('glibc')
makedepends=(
  'git'
  'make'
)
source=(
  "${pkgname}::git+https://github.com/phijor/${_gitname}.git#tag=${pkgver}"
  "https://github.com/phijor/${_gitname}/releases/download/${pkgver}/${_gitname}-${pkgver}.tar.gz"
)
md5sums=(
  'SKIP'
  '9ff482cd312713c287208426f6cd2f30'
)

pkgver() {
  cd "${pkgname}"
  git describe --tags --abbrev=0
}

build() {
  cd "${srcdir}/${pkgname}/linux"
  make
}

package() {
  cd "${srcdir}/${pkgname}/linux"
  make install DESTDIR="${pkgdir}"

  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/${_gitname}
  install -Dm644 ctroller.{3dsx,smdh,cia} ${pkgdir}/usr/share/${_gitname}/
}

# vim:set ts=2 sw=2 et:
