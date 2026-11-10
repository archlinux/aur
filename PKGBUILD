# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: rowq-bin  (pre-built binary — no Rust toolchain required)
# AUR page: https://aur.archlinux.org/packages/rowq-bin

pkgname=rowq-bin
pkgver=1.0.1
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

sha256sums_x86_64=('b1f83c857605e31f8c4a3235ee19d133f87a75423aab5458763af9311c1b303b')
sha256sums_aarch64=('32a5f81ee971fad7694e32a688d7b6d6d9c52f262fbde3b0985fb13a6ad91deb')

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
