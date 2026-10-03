# Maintainer: arqueon <arqueonautis@gmail.com>
pkgname=dms-shell-plugin-dankmail
pkgver=0.3.11
pkgrel=1
pkgdesc="Dankmail Unread companion for DankMaterialShell (unread counts and mail triage)"
arch=('any')
url="https://github.com/arqueon/dankmail"
license=('GPL-3.0-or-later')
depends=('dankmail' 'dms-shell')
install=dms-shell-plugin-dankmail.install
source=("dankmail-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c32544de311968325b54f255f474754fe0c31fb47b56c8bc1d60f9aa7c9a5ae')

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
