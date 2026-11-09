# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: rowq-bin  (pre-built binary — no Rust toolchain required)
# AUR page: https://aur.archlinux.org/packages/rowq-bin

pkgname=rowq-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Query rows in tables, documents and databases from the terminal (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/denisotree/rowq"
license=('Apache-2.0')
depends=()
provides=('rowq')
conflicts=('rowq')

_base_url="https://github.com/denisotree/rowq/releases/download/v${pkgver}"

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::${_base_url}/rowq-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::${_base_url}/rowq-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('7c4a769130633b5c2dccdcc921e04340322237725ecec4d6bba190779704876a')
sha256sums_aarch64=('4676aa1b301d690be418e6bc0b07808c03157b0e19e0ffe4d452494a777af4d1')

package() {
    local _src_dir="rowq-v${pkgver}-${CARCH}-unknown-linux-gnu"
    if [[ "$CARCH" == "x86_64" ]]; then
        _src_dir="rowq-v${pkgver}-x86_64-unknown-linux-gnu"
    else
        _src_dir="rowq-v${pkgver}-aarch64-unknown-linux-gnu"
    fi

    install -Dm755 "${_src_dir}/rowq" "$pkgdir/usr/bin/rowq"
    install -Dm644 "${_src_dir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
