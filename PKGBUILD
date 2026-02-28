pkgname=passkeyd
pkgver=1.2.0
pkgrel=1
pkgdesc="Opinionated WebAuthn authenticator backed by a TPM"
arch=('x86_64')
license=('GPL3')
depends=("tpm2-tss")
makedepends=()
url="https://github.com/bjn7/passkeyd"
source=("https://github.com/bjn7/passkeyd/releases/download/v$pkgver/passkeyd-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('95f79ee4fed97ebec16b5eb9d495cc5e8e34443654ea6eb4af1370a935d7e1c6')
options=('!debug')

package() {
    cd "$srcdir"
    
    # binary
    install -Dm755 passkeyd "$pkgdir/usr/bin/passkeyd"

    install -Dm755 passkeyd-enroll "$pkgdir/usr/lib/passkeyd/passkeyd-enroll"
    install -Dm755 passkeyd-select "$pkgdir/usr/lib/passkeyd/passkeyd-select"

    install -d -m 755 -o root -g root "$pkgdir/var/lib/passkeyd/database"
    install -Dm644 passkeyd.conf "$pkgdir/etc/passkeyd.conf"

    # install service
    install -Dm644 "$srcdir/passkeyd.service" "$pkgdir/usr/lib/systemd/system/passkeyd.service"

    install -Dm644 icons/32x32/passkeyd.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/passkeyd.png"
    install -Dm644 icons/64x64/passkeyd.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/passkeyd.png"
    install -Dm644 theme.conf "$pkgdir/usr/share/passkeyd/theme.conf"
}