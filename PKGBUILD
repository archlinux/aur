# Maintainer: Matthias Schabhüttl <matthias@matthiasschabhuettl.com>
pkgname=bentwire-bin
_pkgname=bentwire
pkgver=0.1.1
pkgrel=1
pkgdesc='Desktop characters (Microsoft Agent and Office Assistant formats) for Wayland (release binaries)'
arch=(x86_64)
url='https://github.com/mschabhuettl/bentwire'
license=('MIT OR Apache-2.0' 'LGPL-2.1-or-later')
depends=(alsa-lib glibc libgcc libxkbcommon)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!debug)
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('016b3cef4efe04ac7d657816967436e125b923dd6d6e3f82bcc35ed3b16d3f33')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-gnu"
  install -Dm755 bentwired bentwire bentwire-convert -t "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/share/bentwire/characters"
  cp -r --no-preserve=ownership characters/builtin "$pkgdir/usr/share/bentwire/characters/"
  install -Dm644 packaging/dbus/org.bentwire.Agent.service -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 packaging/systemd/bentwired.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE-MIT LICENSE-APACHE fonts/LICENSE-LGPL-2.1.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}
