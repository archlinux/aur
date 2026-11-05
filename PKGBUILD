# Maintainer: denisotree <denisotree@users.noreply.github.com>
# AUR package: qrow-bin  (pre-built binary — no Rust toolchain required)
# AUR page: https://aur.archlinux.org/packages/qrow-bin

pkgname=qrow-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Query rows in tables, documents and databases from the terminal (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/denisotree/qrow"
license=('Apache-2.0')
depends=()
provides=('qrow')
# tuitab-bin and tuitab are the same program under its former name.
conflicts=('qrow' 'tuitab' 'tuitab-bin')
replaces=('tuitab-bin')

_base_url="https://github.com/denisotree/qrow/releases/download/v${pkgver}"

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::${_base_url}/qrow-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::${_base_url}/qrow-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('1fd8e1327c39a162e54ef5ee66f691f3bfd54ffc6a2f639185957999a0934d5e')
sha256sums_aarch64=('72370049089a3cff10ba73363b076b3b1f75e5a3c27c471d9dc1562f10b074f5')

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
