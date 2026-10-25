# Maintainer: broroeror <54515333+broroeror@users.noreply.github.com>
pkgname=wallhost
pkgver=0.1.0
pkgrel=1
pkgdesc="Animated wallpapers (Wallpaper Engine workshop content) behind the KDE Plasma desktop, crash-isolated from plasmashell"
arch=('any')
url="https://github.com/broroeror/wallhost"
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'qt6-svg' 'python-dbus' 'python-gobject' 'kwin' 'systemd'
         'linux-wallpaperengine-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d5913ad881971f09c88dcf868253be26cb80885c23d697401ad8208cf05eb206')

check() {
  cd "$pkgname-$pkgver"
  python -m py_compile wallhost*.py
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/lib/wallhost" \
    wallhost.py wallhost_picker.py wallhost_tray.py wallhost_fixes.py wallhost-kwin.js
  install -Dm644 icons/wallhost.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wallhost.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm755 packaging/wallhost "$pkgdir/usr/bin/wallhost"
  install -Dm755 packaging/wallhost-picker "$pkgdir/usr/bin/wallhost-picker"
  install -Dm755 packaging/wallhost-tray "$pkgdir/usr/bin/wallhost-tray"
  install -Dm644 packaging/wallhost-picker.desktop "$pkgdir/usr/share/applications/wallhost-picker.desktop"
  install -Dm644 packaging/wallhost.service "$pkgdir/usr/lib/systemd/user/wallhost.service"
}
