# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=material-companion
pkgver=1.0.0
pkgrel=1
pkgdesc='MaterialCompanion'
arch=('x86_64')
url='https://github.com/MaterialFoundry/MaterialCompanion'
license=('Custom')
depends=('electron' 'nodejs')
makedepends=('git' 'npm')
provides=('material-companion')
conflicts=('material-companion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MaterialFoundry/MaterialCompanion/archive/v${pkgver}.tar.gz"
		material-companion.desktop
		material-companion)
sha256sums=('32c6e8c51bab39061b957c51d3ceafc85890cbb7424de5e8158eda6d6e91cded'
            'ffd52de96b51e26aef5044413c311d19f829514f5463342eebcf3fdcef03f41d'
            '1ccb8679f88551b552c08a8cf11c24fa46d80d9fd6f890722861b59bce210387')
prepare() {
  cd "MaterialCompanion-$pkgver"
  npm update
  npm install
}

build() {
  cd "MaterialCompanion-$pkgver"
  npm run package
}
package() {
  install -Dm644 -t "$pkgdir/usr/share/applications" material-companion.desktop
  install -Dm755 -t "$pkgdir/usr/bin" material-companion
  cd "MaterialCompanion-$pkgver"
  install -Dm644 "src/app/images/icons/png/1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/$pkgname.png"
  install -Dm644 "src/app/images/icons/png/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "src/app/images/icons/png/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "src/app/images/icons/png/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 "src/app/images/icons/png/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 "src/app/images/icons/png/48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 "src/app/images/icons/png/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 "src/app/images/icons/png/24x24.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/$pkgname.png"
  install -Dm644 "src/app/images/icons/png/16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
  install -dm755 "$pkgdir/usr/lib/material-companion"
  ls out/'Material Companion-linux-x64'
  cp -rt "$pkgdir/usr/lib/material-companion" out/'Material Companion-linux-x64'/*
}
