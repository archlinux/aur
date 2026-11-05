# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: qrow-bin  (pre-built binary — no Rust toolchain required)
# AUR page: https://aur.archlinux.org/packages/qrow-bin

pkgname=qrow-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Query rows in tables, documents and databases from the terminal (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/denisotree/qrow"
license=('Apache-2.0')
depends=()
provides=('qrow')
conflicts=('qrow')

_base_url="https://github.com/denisotree/qrow/releases/download/v${pkgver}"

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::${_base_url}/qrow-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::${_base_url}/qrow-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('512e44c47a4056b3041a09a81a95dbb1d1df5447930f607ffad2426e181e421b')
sha256sums_aarch64=('dc27572085957c6fffcd20e9477a19b66c524a0a3f48440c188462fd959ac705')

package() {
    local _src_dir="qrow-v${pkgver}-${CARCH}-unknown-linux-gnu"
    if [[ "$CARCH" == "x86_64" ]]; then
        _src_dir="qrow-v${pkgver}-x86_64-unknown-linux-gnu"
    else
        _src_dir="qrow-v${pkgver}-aarch64-unknown-linux-gnu"
    fi

    install -Dm755 "${_src_dir}/qrow" "$pkgdir/usr/bin/qrow"
    ln -s /usr/bin/qrow "$pkgdir/usr/bin/qrw"
    install -Dm644 "${_src_dir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
