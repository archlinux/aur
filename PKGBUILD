# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: qrow-bin  (pre-built binary — no Rust toolchain required)
# AUR page: https://aur.archlinux.org/packages/qrow-bin

pkgname=qrow-bin
pkgver=1.1.1
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

sha256sums_x86_64=('7d4d1d15ee9abf63ffba79e87649cd604fcef1b7add11ac8185eb17cae436058')
sha256sums_aarch64=('72e2b5bcc360a34a7582a9ec4e3fa361adbc0c081bb3335d7d96f3418fec3f10')

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
