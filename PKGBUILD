# Maintainer: David Birks <david@tellus.space>

pkgname=luna
pkgver=3.1.0
pkgrel=1
pkgdesc='Manage npm dependencies through a modern UI'
arch=('x86_64')
depends=('npm' 'electron')
makedepends=('yarn')
url='https://github.com/rvpanoz/luna'
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rvpanoz/luna/archive/v${pkgver}.tar.gz"
        'luna.desktop'
        'luna.sh')
sha512sums=('bfa885709bf40d1720cd293691fb74bb8a02ebb2173f9b2ce6732246b05e843fc32039e710ee6c3fd1fb5503f8f133ff14b4e3159b6b1821ce1febba85a08577'
            '25c04ad1f3eb6661558bbefbb383005e3c229cc0a14b6ccb031b49ff13d2ca3b925a99ee847161ab9b33882670683a362a1ed21a2e1eab8aa87a044bdd9e9860'
            '96d5450563aae807157c86cf2578392f8c83f0169503bfcd365d9e648829ace28562ba254c9fb5c9ce8b41f287d7e464d1f102389a956a8780696cdb2f5edfb5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  #yarn install
  npm install
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #yarn build:dir
  npm run package-linux --target dir
}

package() {
  # Install app.asar and launcher script
  install -D "$srcdir/$pkgname-$pkgver/release/linux-unpacked/resources/app.asar" "$pkgdir/usr/share/luna/app.asar"
  install -D "$srcdir/luna.sh" "$pkgdir/usr/bin/$pkgname"

  # Install desktop file and icon
  install -D "$srcdir/luna.desktop" "$pkgdir/usr/share/applications/luna.desktop"
  install -D "$srcdir/$pkgname-$pkgver/resources/icon.png" "$pkgdir/usr/share/pixmaps/luna.png"
}
