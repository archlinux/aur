# Maintainer: arqueon <arqueonautis@gmail.com>
pkgname=dms-shell-plugin-dankmail
pkgver=0.4.0
pkgrel=1
pkgdesc="Dankmail Unread companion for DankMaterialShell (unread counts and mail triage)"
arch=('any')
url="https://github.com/arqueon/dankmail"
license=('GPL-3.0-or-later')
depends=('dankmail' 'dms-shell')
install=dms-shell-plugin-dankmail.install
source=("dankmail-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e1419f4a1c48b6da9d840471b531c0dd6c3595e79d1bf3e78931282e5839efd5')

package() {
  cd "dankmail-$pkgver"
  # DMS discovers packaged plugins here, separately from user-managed copies.
  local plugin_dir=/etc/xdg/quickshell/dms-plugins/dankmailUnread
  install -Dm644 dms-plugin/plugin.json "$pkgdir$plugin_dir/plugin.json"
  install -m644 dms-plugin/*.qml "$pkgdir$plugin_dir/"
  install -dm755 "$pkgdir$plugin_dir/translations"
  install -m644 dms-plugin/translations/*.json "$pkgdir$plugin_dir/translations/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
