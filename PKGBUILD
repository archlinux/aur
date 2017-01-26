# Maintainer: Philipp Joram <mail AT phijor DOT me>

pkgname=cutentr-git
pkgver=0.1.1.r4.gc082b06
pkgrel=1
pkgdesc="POC Qt 3DS streaming client for NTR CFW"
arch=('x86_64')
url="https://gitlab.com/BoltsJ/cuteNTR"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'make')
source=("${pkgname}::git+https://gitlab.com/BoltsJ/cuteNTR.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --always --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" cutentr
  install -Dm644 -t "${pkgdir}/usr/share/applications" cutentr.desktop
}

# vim:set ts=2 sw=2 et:
