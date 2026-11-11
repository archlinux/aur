# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from {actual_model_used_for_push}.

pkgname=zxc-full-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Asymmetric lossless compression library for ultra-fast decode (development: CLI + C library + headers + CMake — prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/hellobertrand/zxc"
license=('BSD-3-Clause')
provides=('zxc-full')
conflicts=('zxc-full')
options=('!debug' '!strip')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/hellobertrand/zxc/releases/download/v${pkgver}/zxc-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/hellobertrand/zxc/releases/download/v${pkgver}/zxc-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('d576dcae5dfc54c9e72ab513731aef2dab939bcb88586e7d37736f4b5c308d10')
sha256sums_aarch64=('49372b29da3ab40a0816178a4dbcb58fbfe67497f374404da2d76eb804763e01')

package() {
  local _arch="${CARCH}"
  [[ "${_arch}" == "aarch64" ]] && _arch="arm64"
  local _dir="${srcdir}/zxc-${pkgver}-linux-${_arch}"

  install -Dm755 "${_dir}/bin/zxc" "${pkgdir}/usr/bin/zxc"
  install -d "${pkgdir}/usr/bin"
  ln -s zxc "${pkgdir}/usr/bin/unzxc"
  ln -s zxc "${pkgdir}/usr/bin/zxccat"
  install -Dm755 "${_dir}/bin/zxcgrep" "${pkgdir}/usr/bin/zxcgrep"
  install -Dm755 "${_dir}/bin/zxcless" "${pkgdir}/usr/bin/zxcless"

  mkdir -p "${pkgdir}/usr/include"
  cp -r "${_dir}/include/"* "${pkgdir}/usr/include/"
  install -Dm644 "${_dir}/lib/libzxc.a" "${pkgdir}/usr/lib/libzxc.a"
  install -Dm644 "${_dir}/lib/pkgconfig/libzxc.pc" "${pkgdir}/usr/lib/pkgconfig/libzxc.pc"
  mkdir -p "${pkgdir}/usr/lib/cmake"
  cp -r "${_dir}/lib/cmake/zxc" "${pkgdir}/usr/lib/cmake/"

  install -Dm644 "${_dir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_dir}/THIRD_PARTY_NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES"
}
