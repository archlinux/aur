# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=snip-rs
pkgver=0.1.2
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

sha256sums_x86_64=('045d98457513b6aeac7246a374814d46b2f82e8d47e7479d5510e4aae3b328f8')
sha256sums_aarch64=('66ec5569a0d4905555420762576554e8782a59ae9c764b16a3810c34e3f40989')

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
