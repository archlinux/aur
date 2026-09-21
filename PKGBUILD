# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.

pkgname=zxc-full-bin
pkgver=0.14.1
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
sha256sums_x86_64=('d75bfe0493747d7a9af6f06be990e62e0f84dc493e6fd2109c8752aebe6b1adf')
sha256sums_aarch64=('14b4abf6240827b0cdc2d6e60a96df416c69bcab349f432b240fea55e1e0647d')

package() {
  local _arch="${CARCH}"
  [[ "${_arch}" == "aarch64" ]] && _arch="arm64"
  local _dir="${srcdir}/zxc-${pkgver}-linux-${_arch}"

  install -Dm755 "${_dir}/bin/zxc" "${pkgdir}/usr/bin/zxc"
  install -dm755 "${pkgdir}/usr/include"
  cp -r "${_dir}/include/"* "${pkgdir}/usr/include/"
  install -Dm644 "${_dir}/lib/libzxc.a" "${pkgdir}/usr/lib/libzxc.a"
  install -Dm644 "${_dir}/lib/pkgconfig/libzxc.pc" "${pkgdir}/usr/lib/pkgconfig/libzxc.pc"
  install -dm755 "${pkgdir}/usr/lib/cmake/zxc"
  cp -r "${_dir}/lib/cmake/zxc/"* "${pkgdir}/usr/lib/cmake/zxc/"
  install -Dm644 "${_dir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
