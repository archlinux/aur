# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=snip-rs
pkgver=0.2.4
pkgrel=1
pkgdesc="A minimal snippet sharing service with API, CLI, and web frontend"
arch=('x86_64' 'aarch64')
url="https://github.com/skorotkiewicz/snip"
license=('MIT')
depends=()
options=(!strip)
install=snip.install

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/snip-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/snip-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('166551f1de4928991af9c2e8c50c3e67d1d2631bd180093d92689b40e5268229')
sha256sums_aarch64=('68ce4c2128ba9aac99a9233bdf35525c2836f093631cecd2cfb9bec8629d8ff9')

package() {
    install -Dm755 snipped "${pkgdir}/usr/bin/snipped"
    install -Dm755 snip "${pkgdir}/usr/bin/snip"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # systemd service files
    install -Dm644 systemd/snip.service "${pkgdir}/usr/lib/systemd/system/snip.service"
    install -Dm644 systemd/snip.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/snip.conf"

    # Create data directory
    install -dm755 "${pkgdir}/var/lib/snip"
}
