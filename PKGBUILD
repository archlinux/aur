# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: tuitab-bin  (pre-built binary — no Rust toolchain required)
# AUR page: https://aur.archlinux.org/packages/tuitab-bin

pkgname=tuitab-bin
pkgver=0.10.2
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

sha256sums_x86_64=('e9628e2d65a5245851a3a4f07b1db16577abeb17a67d2864cb591088d2a42337')
sha256sums_aarch64=('9201cd43a04d1a89b7ef23f72f51a246b740248d9ef33d8046cb8bc5732c6909')

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
