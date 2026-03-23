# Maintainer: pharmaracist <pharmaracist@github>
pkgname=noon-mirsald
pkgdesc="مرسال — Noon native messaging host daemon for browser download interception"
pkgver=r10.1eda45f
pkgrel=1
arch=("any")
url="https://github.com/pharmaracist/mirsal"
license=("MIT")
depends=("python3")
makedepends=("git")
provides=("noon-mirsald")
source=("noon-mirsald::git+https://github.com/pharmaracist/mirsal.git")
sha256sums=("SKIP")

pkgver() {
  cd noon-mirsald
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 "${pkgdir}/usr/lib/noon-mirsal"
    install -dm755 "${pkgdir}/usr/lib/mozilla/native-messaging-hosts"
    install -dm755 "${pkgdir}/usr/lib/firefox/native-messaging-hosts"

    install -Dm755 "${srcdir}/mirsal"      "${pkgdir}/usr/bin/mirsal"
    install -Dm755 "${srcdir}/mirsald"      "${pkgdir}/usr/lib/noon-mirsal/mirsald"
    install -Dm644 "${srcdir}/protocol.py"  "${pkgdir}/usr/lib/noon-mirsal/protocol.py"

    install -Dm644 "${srcdir}/noon_mirsal.json" \
        "${pkgdir}/usr/lib/mozilla/native-messaging-hosts/noon_mirsal.json"
    install -Dm644 "${srcdir}/noon_mirsal.json" \
        "${pkgdir}/usr/lib/firefox/native-messaging-hosts/noon_mirsal.json"
}
