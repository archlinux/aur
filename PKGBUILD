# Maintainer: Philipp Joram <mail AT phijor DOT me>

_gitname=ctroller
pkgname=${_gitname}-git
pkgver=r32.fb7aa2d
pkgrel=1
pkgdesc="Use your 3DS as a gamepad on your Linux PC"
arch=('x86_64')
url="https://github.com/phijor/ctroller"
license=('GPL3')
depends=('glibc')
makedepends=(
  'git'
  'make'
  'devkitarm'
  'ctrulib-git'
  'projectctr-makerom-git'
  'bannertool-git'
)
source=("${pkgname}::git+https://github.com/phijor/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}/linux"
  make install DESTDIR="${pkgdir}"

  cd "${srcdir}/${pkgname}/3DS"
  install -dm755 ${pkgdir}/usr/share/${_gitname}
  install -Dm644 ctroller.{3dsx,smdh,cia} ${pkgdir}/usr/share/${_gitname}/
}

# vim:set ts=2 sw=2 et:
