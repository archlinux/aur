# Maintainer: taotieren <admin@taotieren.com>

pkgname=toshibacomextractor
_name=ToshibaComExtractor
pkgver=0.1
pkgrel=1
pkgdesc='Quick and dirty tool to extract Toshiba .COM firmware files, released so it does not get lost.'
arch=($CARCH)
url='https://github.com/LongSoft/ToshibaComExtractor'
license=('BSD-2-Clause')
provides=(
  ${pkgname}
  comextract
)
conflicts=(
  ${pkgname}
  comextract
)
replaces=()
depends=(
  glibc
)
makedepends=(
  cmake
  pkgconf
)
checkdepends=()
optdepends=()
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('03bb5fa8d0274800bb586e1914e8d534233fe77d')

build() {
  cd "${srcdir}"/${_name}-${pkgver}/
  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -Wno-dev \
    -B build

  cmake --build build
}

package() {
  cd "${srcdir}"/${_name}-${pkgver}
  install -vDm755 build/comextract -t "${pkgdir}"/usr/bin
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
