#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

_pkg=container2wasm
pkgname=$_pkg-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="Container to WASM converter"
arch=('x86_64' 'aarch64')
conflicts=('container2wasm')
provides=('container2wasm')
optdepends=('wasmtime'
            'wasmer')
source=(
  "LICENSE::https://raw.githubusercontent.com/container2wasm/container2wasm/refs/tags/v$pkgver/LICENSE"
  "c2w-net-proxy.wasm::https://github.com/container2wasm/container2wasm/releases/download/v$pkgver/c2w-net-proxy.wasm"
)
source_x86_64=("$pkgname-$pkgver-x86_64::https://github.com/container2wasm/container2wasm/releases/download/v$pkgver/container2wasm-v$pkgver-linux-amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64::https://github.com/container2wasm/container2wasm/releases/download/v$pkgver/container2wasm-v$pkgver-linux-arm64.tar.gz")
url="https://github.com/container2wasm/container2wasm"
license=("Apache-2.0")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
            '2156167ecd413d1b7a0f5cf404e4a99967a9ae37c96161621ebb9f0b15d97638')
sha256sums_x86_64=('1142ab95212578c0c7f666de830de6945f2abbea1713d1e07a7cb04072e00f31')
sha256sums_aarch64=('ff86ce5fbc4cd388080ecc5a5b87efd0f168cbe888175cdf7f8fc1d066d3011f')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "c2w" "$pkgdir/usr/bin/c2w"
  install -Dm755 "c2w-net" "$pkgdir/usr/bin/c2w-net"
  install -Dm644 "${srcdir}/c2w-net-proxy.wasm" "${pkgdir}/usr/share/${_pkg}/c2w-net-proxy.wasm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkg}/LICENSE"
}
