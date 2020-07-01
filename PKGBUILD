# Maintainer: Antony Kellermann <aokellermann@gmail.com>

_pkgname=iex
pkgname="${_pkgname}-git"
pkgver=0.1.0
pkgrel=1
pkgdesc="C++17 library for querying IEX Cloud API."
arch=("x86_64")
url="https://github.com/aokellermann/${_pkgname}"
license=("MIT")
depends=("curl" "nlohmann-json")
optdepends=("doxygen: documentation")
makedepends=("cmake" "git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/aokellermann/${_pkgname}")
md5sums=("SKIP")

prepare() {
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
