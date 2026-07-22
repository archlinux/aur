# Maintainer: psdkjoon <psdkjoon@gmail.com>
# This package installs the prebuilt release from GitHub — no Flutter/Dart
# SDK is required to build or install it. pkgver/sha256sums are updated
# automatically by .github/workflows/publish.yml on every tagged release.
pkgname=plm-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="PSDK Login Manager — a minimal Flutter/PAM login manager (prebuilt)"
arch=('x86_64')
url="https://github.com/psdkjoon/plm"
license=('MIT')
depends=('gtk3' 'pam' 'cage')
provides=('plm')
conflicts=('plm')
source=("plm-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/plm-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('c07841948b865cc6d0d4ade399f673e3db9503ae2e673a713ddb812218f21809')

package() {
  cd "$srcdir"

  install -d "$pkgdir/usr/lib/plm"
  cp -r bundle/. "$pkgdir/usr/lib/plm/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/plm/plm "$pkgdir/usr/bin/plm"

  install -Dm755 packaging/plm-session "$pkgdir/usr/lib/plm/plm-session"
  install -Dm644 packaging/pam.d/plm "$pkgdir/etc/pam.d/plm"
  install -Dm644 packaging/systemd/plm.service \
    "$pkgdir/usr/lib/systemd/system/plm.service"
  install -Dm644 packaging/systemd/session@.service \
    "$pkgdir/usr/lib/systemd/system/session@.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/plm/README.md"
}
