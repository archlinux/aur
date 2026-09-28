# Maintainer: Simon Schubert <simon@librem.one>
#
# Crypto Market as an app: the QML tree in /usr/share/crypto-market, started
# by /usr/bin/crypto-market. That launcher opens it in the running Omarchy
# shell when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
pkgname=crypto-market
pkgver=1.2.0
pkgrel=1
pkgdesc='CoinGecko prices, coin pages, a watchlist and a portfolio, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick, QtQuick.Shapes) comes with quickshell. The icons
# are Nerd Font glyphs, which namcap cannot see, so it calls this dependency
# unneeded -- as it does quickshell, for the same reason.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
# A release asset that packaging/release.sh builds from apps/crypto-market at
# the tag, not GitHub's generated archive of the whole repository.
source=("$url/releases/download/crypto-market-v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('02979a3d87dd7d4e79676b0527217dd96f9759ca35aa818c7de78b749a4c8e19')

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname"
  install -m644 manifest.json ./*.qml ./*.js ./*.mjs icon.svg \
    "$pkgdir/usr/share/$pkgname/"

  install -Dm755 bin/crypto-market "$pkgdir/usr/bin/crypto-market"
  install -Dm644 crypto-market.desktop "$pkgdir/usr/share/applications/crypto-market.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/crypto-market.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
