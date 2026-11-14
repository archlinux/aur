# Maintainer: arqueon <arqueonautis@gmail.com>
pkgname=dms-shell-plugin-dux-mail
pkgver=0.5.0
pkgrel=1
pkgdesc="Dux Mail Unread companion for Dux Shell / DankMaterialShell (unread counts and mail triage)"
arch=('any')
url="https://github.com/arqueon/dux-mail"
license=('GPL-3.0-or-later')
depends=('dux-mail' 'dms-shell')
provides=("dms-shell-plugin-dankmail=$pkgver")
conflicts=('dms-shell-plugin-dankmail')
replaces=('dms-shell-plugin-dankmail')
install=dms-shell-plugin-dux-mail.install
source=("dux-mail-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee95f331c3119fbd56f9bf2673ee916e2b11942227552cb3da9b9fc5bc492077')

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
