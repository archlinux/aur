# Maintainer: Simon Schubert <simon@librem.one>
#
# Couch for Trakt as an app: the QML tree in /usr/share/couch-for-trakt,
# started by /usr/bin/couch-for-trakt. That launcher opens it in the running
# Omarchy shell when the plugin is installed there, and as its own Quickshell
# process everywhere else -- so this package needs Quickshell, not Omarchy.
pkgname=couch-for-trakt
pkgver=1.2.0
pkgrel=1
pkgdesc='A movie and TV tracker for Trakt: discover, up next, calendar, watchlist and history, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick, QtQuick.Effects) comes with quickshell. The icons
# are Nerd Font glyphs, which namcap cannot see, so it calls this dependency
# unneeded -- as it does quickshell, for the same reason.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/couch-for-trakt
# at the tag, not GitHub's generated archive of the whole repository.
source=("$url/releases/download/couch-for-trakt-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('07bc9b5325693917f503643f5079106eda2fbc0d188247950a64527c998a825e')

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname"
  install -m644 manifest.json ./*.qml ./*.js ./*.mjs icon.svg \
    "$pkgdir/usr/share/$pkgname/"

  install -Dm755 bin/couch-for-trakt "$pkgdir/usr/bin/couch-for-trakt"
  install -Dm644 couch-for-trakt.desktop "$pkgdir/usr/share/applications/couch-for-trakt.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/couch-for-trakt.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
