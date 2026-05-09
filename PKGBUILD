# Maintainer: MrToadie <toadie.linux@proton.me>

pkgname=cert-checker
pkgver=1.1.5
pkgrel=1
pkgdesc="simple validity checker for website certificates"
arch=('x86_64')
url="https://github.com/mrtoadie/go-check-cert"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'base-devel')
source=("git+${url}.git")
sha256sums=('SKIP')


build() {
    cd "$srcdir/go-check-cert"

    # Option A: Build von Root mit Pfadangabe (empfohlen)
    # Finde das cmd-Verzeichnis und baue daraus
    go build -ldflags="-s -w" -o "$pkgname" ./cmd
    upx --best --lzma cert-checker
}

package() {
    # Ziel‑Verzeichnisse innerhalb des Sandbox‑Root ($pkgdir) anlegen
    install -dm755 "$pkgdir/usr/bin"

    # Das tatsächlich gebaute Binary kopieren
    install -m755 "$srcdir/go-check-cert/cert-checker" \
                   "$pkgdir/usr/bin/$pkgname"
}
