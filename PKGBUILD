# Maintainer: Simon Schubert <simon@librem.one>
#
# Crypto Market as an app: the QML tree in /usr/share/crypto-market, started
# by /usr/bin/crypto-market. That launcher opens it in the running Omarchy
# shell when the plugin is installed there, and as its own Quickshell process
# everywhere else -- so this package needs Quickshell, not Omarchy.
pkgname=crypto-market
pkgver=1.1.0
pkgrel=1
pkgdesc='CoinGecko prices, coin pages, a watchlist and a portfolio, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/omarchy-crypto-market'
license=('MIT')
# qt6-declarative (QtQuick, QtQuick.Shapes) comes with quickshell. The icons
# are Nerd Font glyphs, which namcap cannot see, so it calls this dependency
# unneeded -- as it does quickshell, for the same reason.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2fee44cbf557b7f4ceab64848a6dad468f630e7466fd0b5ee9b1934957a8fc15')

package() {
  cd "omarchy-crypto-market-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname"
  install -m644 manifest.json ./*.qml ./*.js ./*.mjs icon.svg \
    "$pkgdir/usr/share/$pkgname/"

  install -Dm755 bin/crypto-market "$pkgdir/usr/bin/crypto-market"
  install -Dm644 crypto-market.desktop "$pkgdir/usr/share/applications/crypto-market.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/crypto-market.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
