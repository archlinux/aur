# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from {actual_model_used_for_push}.

pkgname=zxc-full-bin
pkgver=1.0.2
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
sha256sums_x86_64=('c46239c933dab799e649527ed23f05a7acc4103d9e261e627d46ba9bb4f7227e')
sha256sums_aarch64=('f02f776482179c6464ba4fd4605d48efce5a8e541be367559a5c0f4253421bf9')

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
