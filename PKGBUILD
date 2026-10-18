# Maintainer: İbrahim Hakkı Ergin <ibrahimh.ergin@gmail.com>
pkgname=linux-boot-analyzer-bin
pkgver=1.1.0
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
sha256sums_x86_64=('435c4290e85bb9acd3d36bebfdbdd33e7f523387c2cc24c484c0e8ed20422647')
sha256sums_aarch64=('7984e90f897e6c53814541303ad5110924cc6a21a249a89b22d595df3352359d')

package() {
    install -Dm755 "$srcdir/$_upstream-$_triple/linux-boot-analyzer" \
        "$pkgdir/usr/bin/linux-boot-analyzer"
    install -Dm644 "$srcdir/$_upstream-$_triple/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
