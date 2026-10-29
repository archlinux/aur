# Maintainer: smiley <smiley@archlinux.org>
pkgname=passfox-host
pkgver=0.5.2
pkgrel=1
pkgdesc="Native messaging host for passfox, the Firefox add-on that fills logins from pass"
arch=('any')
url="https://github.com/AuthenticSm1les/passfox"
license=('MPL-2.0')
depends=('pass' 'python')
optdepends=('firefox: the passfox add-on, from addons.mozilla.org')
source=("passfox-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7b35b38f9198c42c639dd07788c3dd945be1faf8813ba9a58d4e9c2d5a577fe')

package() {
  cd "passfox-$pkgver"
  install -Dm755 host/passfox_host.py "$pkgdir/usr/lib/passfox/passfox_host.py"
  sed "s|@HOST_PATH@|/usr/lib/passfox/passfox_host.py|" host/io.github.smiley.passfox.json \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/mozilla/native-messaging-hosts/io.github.smiley.passfox.json"
}
