# Maintainer: Sandeep Puri <381394+lexlapax@users.noreply.github.com>
pkgname=rweb-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Web client for Rex terminal sessions, reached through Tailscale Serve or SSH"
arch=('x86_64')
url="https://github.com/lexlapax/rweb"
license=('MIT')
provides=('rweb')
conflicts=('rweb')
optdepends=('tailscale: to reach it with rweb tailscale'
            'openssh: to check the release signature, and for rweb ssh')
# The release binary as built and signed: static, stripped, position-independent.
options=('!strip' '!debug')
source=("https://github.com/lexlapax/rweb/releases/download/v${pkgver}/rweb-${pkgver}-linux-x86_64.tar.gz"
        "rweb.service")
sha256sums=('6c07756d32edfb13d8a8f1f8d0ea73d82a58ac1681a04fe2292f51cf8c6f6a27'
            'c3e1e5c05d6a55ad92a5fa597acafadb24de298a2bbf748f5a1a9875e5bbedf7')

package() {
  cd "rweb-${pkgver}-linux-x86_64"
  install -Dm755 rweb "$pkgdir/usr/bin/rweb"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 docs/user-guide.md docs/architecture.md -t "$pkgdir/usr/share/doc/$pkgname/docs/"
  install -Dm644 "$srcdir/rweb.service" "$pkgdir/usr/lib/systemd/user/rweb.service"
}
