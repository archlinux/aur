# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=snip-rs
pkgver=0.1.3
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

sha256sums_x86_64=('109ebf14d00525f34e4a553004c9cb47f6b8c52e323ec882c97e74301f6a1ec7')
sha256sums_aarch64=('038fe06a041cee742fbd71cfeeac59d66048eb9c5f76765141d8dc3cdbc571ee')

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
