# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: tuitab-bin  (pre-built binary — no Rust toolchain required)
# AUR page: https://aur.archlinux.org/packages/tuitab-bin

pkgname=tuitab-bin
pkgver=0.9.6
pkgrel=1
pkgdesc="Terminal tabular data explorer — CSV/JSON/YAML/TOML/Parquet/Excel/SQLite viewer (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/denisotree/tuitab"
license=('Apache-2.0')
depends=()
provides=('tuitab')
conflicts=('tuitab')

_base_url="https://github.com/denisotree/tuitab/releases/download/v${pkgver}"

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::${_base_url}/tuitab-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::${_base_url}/tuitab-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('47c8e1655f4d2da0ede2ed1cbefe650cd45f02697b6ac91db2e5a6c476aca996')
sha256sums_aarch64=('015c8c02d7621b780f875d5c0f4938178d09d1fc96f55e4306b86fb37f05e33f')

package() {
    local _src_dir="tuitab-v${pkgver}-${CARCH}-unknown-linux-gnu"
    if [[ "$CARCH" == "x86_64" ]]; then
        _src_dir="tuitab-v${pkgver}-x86_64-unknown-linux-gnu"
    else
        _src_dir="tuitab-v${pkgver}-aarch64-unknown-linux-gnu"
    fi

    install -Dm755 "${_src_dir}/tuitab" "$pkgdir/usr/bin/tuitab"
    ln -s /usr/bin/tuitab "$pkgdir/usr/bin/ttab"
    ln -s /usr/bin/tuitab "$pkgdir/usr/bin/ttb"
    install -Dm644 "${_src_dir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
