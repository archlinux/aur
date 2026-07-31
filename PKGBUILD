# Maintainer: Fahry-a <farhannzarm@gmail.com>
# PKGBUILD for ODM (Oryn Download Manager) — Arch / CachyOS.
# Pre-built binary package (downloads from GitHub Releases).
#
# Man page, config example, and systemd service are bundled as local source
# files in the AUR repository (no remote download, no checksum mismatch).

pkgname=odm-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Oryn Download Manager — aria2c-inspired CLI download manager with Connection Balancer, parallel download acceleration, pacman/ILoveCandy progress bar, JSON-RPC + WebSocket daemon, and resume support"
arch=('x86_64' 'aarch64')
url="https://github.com/Fahry-a/odm"
license=('MIT')
depends=('glibc')
backup=('etc/odm/config.conf.example')
options=('!strip')

source_x86_64=(
    "${pkgname}-${pkgver}-linux_amd64::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_amd64"
    "${pkgname}-${pkgver}.1"
    "${pkgname}-${pkgver}.conf.example"
    "${pkgname}-${pkgver}.service"
)
source_aarch64=(
    "${pkgname}-${pkgver}-linux_arm64::https://github.com/Fahry-a/odm/releases/download/v${pkgver}/odm_${pkgver}_linux_arm64"
    "${pkgname}-${pkgver}.1"
    "${pkgname}-${pkgver}.conf.example"
    "${pkgname}-${pkgver}.service"
)

sha256sums_x86_64=('b7d5c468299c9126d1bd1a04d6bb775a3e61f8d6eda3cdd353ccd3c6c74e114d'
                    'SKIP'
                    'SKIP'
                    'SKIP')
sha256sums_aarch64=('f80ff4a3f9548250d16cff03a2f8702f0867d4aed6fa94140f457fe60fcb3f26'
                    'SKIP'
                    'SKIP'
                    'SKIP')

package() {
    local _bin
    case "$CARCH" in
        x86_64)  _bin="${pkgname}-${pkgver}-linux_amd64" ;;
        aarch64) _bin="${pkgname}-${pkgver}-linux_arm64" ;;
    esac
    install -Dm755 "$srcdir/$_bin" "$pkgdir/usr/bin/odm"

    install -Dm644 "$srcdir/${pkgname}-${pkgver}.1" "$pkgdir/usr/share/man/man1/odm.1"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.conf.example" "$pkgdir/etc/odm/config.conf.example"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.conf.example" "$pkgdir/etc/odm/config.conf"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}.service" "$pkgdir/usr/lib/systemd/system/odm.service"
}
