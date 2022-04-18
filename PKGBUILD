# Maintainer: Harrison <htv04rules at gmail dot com>

_pkgname=wii-grrlib-mod
_reponame=GRRLIB-mod

pkgname=${_pkgname}-git
pkgver=mod.v1.0.0.r0.gf3b1b96
pkgrel=1
pkgdesc="A C/C++ 2D/3D graphics library for Wii application developers"
arch=("x86_64")
url="https://github.com/HTV04/${_reponame}"
license=("MIT")
depends=("devkitPPC" "libfat-ogc" "ppc-libpngu" "ppc-freetype" "ppc-libjpeg-turbo")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=("!strip") # Binary format is different than expected
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_reponame}"

  git describe --long | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
  cd "${srcdir}/${_reponame}/src"

  make clean all
}

package() {
  cd "${srcdir}/${_reponame}"

  # Install license
  install -Dm0644 LICENSE "${pkgdir}/opt/devkitpro/portlibs/wii/licenses/${pkgname}/LICENSE"

  cd src

  make DESTDIR="${pkgdir}" install
}
