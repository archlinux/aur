# Maintainer: smiley <smiley@archlinux.org>
pkgname=passfox-host
pkgver=0.3.0
pkgrel=1
pkgdesc="Native messaging host for passfox, the Firefox add-on that fills logins from pass"
arch=('any')
url="https://github.com/AuthenticSm1les/passfox"
license=('MPL-2.0')
depends=('pass' 'python')
optdepends=('firefox: the passfox add-on, from addons.mozilla.org')
source=("passfox-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c9afa31a67e0d46da78f7613a2da9807b8601f0603d622c2c7df4d7327d6ff8')

package() {
  cd "passfox-$pkgver"
  install -Dm755 host/passfox_host.py "$pkgdir/usr/lib/passfox/passfox_host.py"
  sed "s|@HOST_PATH@|/usr/lib/passfox/passfox_host.py|" host/io.github.smiley.passfox.json \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/mozilla/native-messaging-hosts/io.github.smiley.passfox.json"
}
