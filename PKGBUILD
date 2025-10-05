#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

_pkg=container2wasm
pkgname=$_pkg-bin
pkgver=0.8.3
pkgrel=3
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
            '7598b66f8307e4f699e0512d8c05df92165b7fa1efe718db2df64f2ec4e8c046')
sha256sums_x86_64=('eac8597edb498bfc9619b724a8890aede79eaf4ab6d4628cd1386d62c8238f84')
sha256sums_aarch64=('4ace5f8deb3a3ba719005f7ca89db5335fc27bfa0fb4c4e31b094ffaeb597021')

package() {
  # Unpack, flag as executable and move to the right directory
  install -Dm755 "c2w" "$pkgdir/usr/bin/c2w"
  install -Dm755 "c2w-net" "$pkgdir/usr/bin/c2w-net"
  install -Dm644 "${srcdir}/c2w-net-proxy.wasm" "${pkgdir}/usr/share/${_pkg}/c2w-net-proxy.wasm"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkg}/LICENSE"
}
