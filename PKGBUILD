pkgname=passkeyd
pkgver=1.3.0
pkgrel=1
pkgdesc="Opinionated WebAuthn authenticator backed by a TPM"
arch=('x86_64')
license=('GPL3')
depends=("tpm2-tss")
makedepends=()
url="https://github.com/bjn7/passkeyd"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjn7/passkeyd/releases/download/v$pkgver/passkeyd-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e818fb8211d12ab547cc31a91f20be9999ef85beeb039883cfea94958f921130')
options=('!debug')
backup=('etc/passkeyd.conf' 'usr/share/passkeyd/theme.conf')

package() {
    cd "$srcdir"
    
    # Binary installation
    install -Dm755 passkeyd "$pkgdir/usr/bin/passkeyd"
    install -Dm755 passkeyd-enroll "$pkgdir/usr/lib/passkeyd/passkeyd-enroll"
    install -Dm755 passkeyd-select "$pkgdir/usr/lib/passkeyd/passkeyd-select"

    # Database directory
    install -d -m 700 -o root -g root "$pkgdir/var/lib/passkeyd/database"

    # Configuration files
    install -Dm644 passkeyd.conf "$pkgdir/etc/passkeyd.conf"
    install -Dm644 theme.conf "$pkgdir/usr/share/passkeyd/theme.conf"

    # Systemd service
    install -Dm644 "$srcdir/passkeyd.service" "$pkgdir/usr/lib/systemd/system/passkeyd.service"
    
    # Icons
    install -Dm644 icons/32x32/passkeyd.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/passkeyd.png"
    install -Dm644 icons/64x64/passkeyd.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/passkeyd.png"
}