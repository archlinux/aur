# Maintainer: MrToadie <toadie@toadie.de>

pkgname=cert-checker
pkgver=1.0.2
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
}

package() {
    # create target directories within the sandbox root ($pkgdir).
    install -dm755 "$pkgdir/usr/bin"
    #install -dm755 "$pkgdir/usr/share/doc/$pkgname"

    # copy the actual built binary
    install -m755 "$srcdir/go-check-cert/$pkgname" \
                   "$pkgdir/usr/bin/$pkgname"
}
