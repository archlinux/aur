# Maintainer: David Birks <david@tellus.space>
# Contributor: Giga300 <giga300@protonmail.com>

pkgname=luna
pkgver=3.3.0
pkgrel=1
pkgdesc='Manage npm dependencies through a modern UI'
arch=('x86_64')
depends=('npm' 'electron')
url='https://github.com/rvpanoz/luna'
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rvpanoz/luna/archive/v${pkgver}-stable.tar.gz"
        'luna.desktop'
        'luna.sh')
sha512sums=('96f368eaf4b6b7f0e28bc42b615498aec6ce4578edd8871363fe08f61a7428354bba71320679442cac6bbeef14d806fb825e2ce45ad63306183a3e1f03d181d8'
            '25c04ad1f3eb6661558bbefbb383005e3c229cc0a14b6ccb031b49ff13d2ca3b925a99ee847161ab9b33882670683a362a1ed21a2e1eab8aa87a044bdd9e9860'
            '96d5450563aae807157c86cf2578392f8c83f0169503bfcd365d9e648829ace28562ba254c9fb5c9ce8b41f287d7e464d1f102389a956a8780696cdb2f5edfb5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-stable"
  npm install
}

build() {
  cd "$srcdir/$pkgname-$pkgver-stable"
  npm run package-linux --target dir
}

package() {
  # Install app.asar and launcher script
  install -D "$srcdir/$pkgname-$pkgver-stable/release/linux-unpacked/resources/app.asar" "$pkgdir/usr/share/luna/app.asar"
  install -D "$srcdir/luna.sh" "$pkgdir/usr/bin/$pkgname"

  # Install desktop file and icon
  install -D "$srcdir/luna.desktop" "$pkgdir/usr/share/applications/luna.desktop"
  install -D "$srcdir/$pkgname-$pkgver-stable/resources/icon.png" "$pkgdir/usr/share/pixmaps/luna.png"
}
