# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: tuitab-bin  (pre-built binary — no Rust toolchain required)
# AUR page: https://aur.archlinux.org/packages/tuitab-bin

pkgname=tuitab-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="Terminal tabular data explorer — CSV/JSON/Parquet/Excel/SQLite viewer (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/denisotree/tuitab"
license=('Apache-2.0')
depends=()
provides=('tuitab')
conflicts=('tuitab')

_base_url="https://github.com/denisotree/tuitab/releases/download/v${pkgver}"

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::${_base_url}/tuitab-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::${_base_url}/tuitab-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('42c7a32539fbcf999b6a26f094a6b84d6fbd481fefba84ad7c7d4468626d0ea5')
sha256sums_aarch64=('267fa961cab1367315206d4e566561a2be38ef52521a3ff1ba7e67ee6be45f20')

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
