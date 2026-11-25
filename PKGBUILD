# Maintainer: arqueon <arqueonautis@gmail.com>
pkgname=dms-shell-plugin-dux-mail
pkgver=0.6.4
pkgrel=1
pkgdesc="Dux Mail Unread companion for Dux Shell / DankMaterialShell (unread counts and mail triage)"
arch=('any')
url="https://github.com/arqueon/dux-mail"
license=('GPL-3.0-or-later')
depends=('dux-mail' 'dms-shell')
provides=("dms-shell-plugin-dankmail=$pkgver")
conflicts=('dms-shell-plugin-dankmail<0.5.1')
replaces=('dms-shell-plugin-dankmail<0.5.1')
install=dms-shell-plugin-dux-mail.install
source=("dux-mail-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed2787a41a62748f3fdd052510974e269bdc642f73d776f646e0824ff9ff773a')

package() {
  cd "dux-mail-$pkgver"
  # DMS discovers packaged plugins here, separately from user-managed copies.
  local plugin_dir=/etc/xdg/quickshell/dms-plugins/dankmailUnread
  install -Dm644 dms-plugin/plugin.json "$pkgdir$plugin_dir/plugin.json"
  install -m644 dms-plugin/*.qml "$pkgdir$plugin_dir/"
  install -dm755 "$pkgdir$plugin_dir/translations"
  install -m644 dms-plugin/translations/*.json "$pkgdir$plugin_dir/translations/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
