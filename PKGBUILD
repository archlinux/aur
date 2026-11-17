# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: rowq-bin  (pre-built binary — no Rust toolchain required)
# AUR page: https://aur.archlinux.org/packages/rowq-bin

pkgname=rowq-bin
pkgver=1.0.3
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

sha256sums_x86_64=('f75ad0655a43201e254c2748abb95f3e996b8cf20d163c066be56a0cebad5ef2')
sha256sums_aarch64=('d9a098a2b6d4ba068399abd6d1286f9e9fedb028cf87cf51e012e91658ba8bdf')

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
