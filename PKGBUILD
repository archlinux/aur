# Maintainer: Kevin Masson <hi@oktomus.com>
_pkgname=tev
pkgname=${_pkgname}
pkgver=v1.15
pkgrel=1
epoch=
pkgdesc="High dynamic range (HDR) image comparison tool for graphics people. Supports primarily OpenEXR files."
arch=("i686" "x86_64")
url="https://github.com/Tom94/tev"
license=('BSD-3-Clause')
depends=("zenity" "mesa" "zlib")
makedepends=("cmake" "git")
provides=("tev")
conflicts=("tev")
install=
source=("${_pkgname}::git+${url}.git#tag=${pkgver}")
md5sums=("SKIP")

prepare() {
  git -C "${_pkgname}" submodule update --init --recursive
  mkdir -p "${_pkgname}/build"
}

build() {
  cd "${_pkgname}/build" || exit 1
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  cmake --build .
}

package() {
  cmake --build "${_pkgname}/build" --target install -- DESTDIR="${pkgdir}"
  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
