# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="HiGHS"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.12.0+0
_pkgver="${pkgver%%+*}"
pkgrel=1
pkgdesc="High performance serial and parallel solver for large scale sparse linear optimization problems"
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://highs.dev"
_url="https://github.com/JuliaBinaryWrappers/HiGHSstatic_jll.jl"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
  'metis'
  'openblas'
)
makedepends=(
  'patchelf'
)
# provides=(
#   "${_pkgname}=${_pkgver}"
# )
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/HiGHSstatic-v${pkgver}/HiGHSstatic.v${_pkgver}.aarch64-linux-gnu-cxx11.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${_url}/releases/download/HiGHSstatic-v${pkgver}/HiGHSstatic.v${_pkgver}.armv6l-linux-gnueabihf-cxx11.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${_url}/releases/download/HiGHSstatic-v${pkgver}/HiGHSstatic.v${_pkgver}.armv7l-linux-gnueabihf-cxx11.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/HiGHSstatic-v${pkgver}/HiGHSstatic.v${_pkgver}.i686-linux-gnu-cxx11.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/HiGHSstatic-v${pkgver}/HiGHSstatic.v${_pkgver}.x86_64-linux-gnu-cxx11.tar.gz")
sha256sums_aarch64=('533780c80cab03cf30c7c35f602f2a543869cb22f981febea6e7d92f2d329f93')
sha256sums_armv6h=('36f663d52b64aea1e967c73aa067ca55f5b255919e3df0f15813824ec42afc08')
sha256sums_armv7h=('e66f65c7be67365b90826944d821b44260e9cf93574ff3e0b8b2f5dfa9f583a4')
sha256sums_i686=('5d757afbec05673dc82ee935dcf1626f50b930de5f2079d7e70fcea105bcc190')
sha256sums_x86_64=('e66c1436351a98869babdbbd9ffd392fbbccd5c686967bdc217afa6201a4b9e7')

prepare() {
  cd "${srcdir}"
  patchelf --remove-rpath "bin/${_pkgname}"
}

package() {
  cd "${srcdir}"
  find "bin" -type f -exec \
    install -vDm755 "{}" "${pkgdir}/usr/{}" \;
  find "include" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  cd "share/licenses/HiGHSstatic"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
