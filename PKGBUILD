# Maintainer: Jozef Gaal <preklady@mayday.sk>
pkgname=orphycleaner
pkgver=2.0.0
pkgrel=1
pkgdesc="GUI tool to find and clean up orphaned and unused app folders in your home directory"
arch=('x86_64' 'aarch64')
url="https://github.com/dodog/orphycleaner"
license=('AGPL-3.0-only')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'glib2' 'hicolor-icon-theme')
optdepends=('yay: description lookups for AUR packages'
            'paru: description lookups for AUR packages'
            'flatpak: detect and describe Flatpak-related folders'
            'xdg-utils: "Open Folder" action (xdg-open)') 
source=("$pkgname-$pkgver.tar.gz::https://github.com/dodog/orphycleaner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da53b44f9babc4bfceaedde968894c7b8dec059609ee6ef31499c41df3293d7a')
install='orphycleaner.install'

_appid=sk.mayday.OrphyCleaner

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 orphycleaner.py "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$_appid.desktop" "$pkgdir/usr/share/applications/$_appid.desktop"

  install -Dm644 icons/orphycleaner.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appid.svg"
  install -Dm644 icons/48x48.png   "$pkgdir/usr/share/icons/hicolor/48x48/apps/$_appid.png"
  install -Dm644 icons/64x64.png   "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_appid.png"
  install -Dm644 icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_appid.png"
  # legacy fallback for tools that only check pixmaps, not the hicolor theme
  install -Dm644 icons/128x128.png "$pkgdir/usr/share/pixmaps/$_appid.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
