# Maintainer: Simon Schubert <simon@librem.one>
#
# Transit as an app: the QML tree in /usr/share/transit, started by
# /usr/bin/transit. That launcher opens it in the running Omarchy shell when
# the plugin is installed there, and as its own Quickshell process everywhere
# else -- so this package needs Quickshell, not Omarchy.
pkgname=transit
pkgver=1.1.0
pkgrel=1
pkgdesc='Public transport journeys and live departures, worldwide, on Transitous, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The icons are Nerd Font
# glyphs, which namcap cannot see, so it calls this dependency unneeded -- as
# it does quickshell, for the same reason.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/transit at the
# tag, not GitHub's generated archive of the whole repository.
source=("$url/releases/download/transit-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('951192739f751cff94fe7467d76aab16b1bd2c304878d4d847154461c0e319c9')

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname"
  install -m644 manifest.json ./*.qml ./*.mjs icon.svg \
    "$pkgdir/usr/share/$pkgname/"

  install -Dm755 bin/transit "$pkgdir/usr/bin/transit"
  install -Dm644 transit.desktop "$pkgdir/usr/share/applications/transit.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/transit.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
