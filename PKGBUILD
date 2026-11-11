# Maintainer: İbrahim Hakkı Ergin <ibrahimh.ergin@gmail.com>
pkgname=linux-boot-analyzer-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A terminal UI that analyses boot time and manages systemd services"
arch=('x86_64' 'aarch64')
url="https://github.com/06ergin06/linux_boot_analyzer_tui"
license=('GPL-3.0-only')
depends=('sudo')
provides=('linux-boot-analyzer')
conflicts=('linux-boot-analyzer' 'linux-boot-analyzer-git')
options=('!strip')

case "$CARCH" in
    x86_64) _triple=x86_64-unknown-linux-musl ;;
    aarch64) _triple=aarch64-unknown-linux-musl ;;
esac
_upstream="linux-boot-analyzer-$pkgver"

source_x86_64=("$url/releases/download/v$pkgver/$_upstream-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_upstream-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('a1ea3d62dd178ceee1e807d983c0282188d4a7908f314ab01179488e3192ee03')
sha256sums_aarch64=('6dd54d75a7810ebb01f9c47831359a39a58d5aaa3f66fb13a20ae490a6e7a84d')

package() {
    install -Dm755 "$srcdir/$_upstream-$_triple/linux-boot-analyzer" \
        "$pkgdir/usr/bin/linux-boot-analyzer"
    install -Dm644 "$srcdir/$_upstream-$_triple/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
