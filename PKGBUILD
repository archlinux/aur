# Maintainer: smiley <smiley@archlinux.org>
pkgname=passfox-host
pkgver=0.2.0
pkgrel=1
pkgdesc="Native messaging host for passfox, the Firefox add-on that fills logins from pass"
arch=('any')
url="https://github.com/AuthenticSm1les/passfox"
license=('MPL-2.0')
depends=('pass' 'python')
optdepends=('firefox: the passfox add-on, from addons.mozilla.org')
source=("passfox-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f665661e711afaa517d4cf6fb18939c75af29b76c10b1400caf01ea7875b805a')

package() {
  cd "passfox-$pkgver"
  install -Dm755 host/passfox_host.py "$pkgdir/usr/lib/passfox/passfox_host.py"
  sed "s|@HOST_PATH@|/usr/lib/passfox/passfox_host.py|" host/io.github.smiley.passfox.json \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/mozilla/native-messaging-hosts/io.github.smiley.passfox.json"
}
