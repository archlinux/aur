# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=material-companion
pkgver=1.0.2
pkgrel=1
pkgdesc='MaterialCompanion'
arch=('x86_64')
url='https://github.com/MaterialFoundry/MaterialCompanion'
license=('Custom')
depends=('electron' 'nodejs' 'python-pymcuprog')
makedepends=('git' 'npm')
provides=('material-companion')
conflicts=('material-companion')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MaterialFoundry/MaterialCompanion/archive/${pkgver}.tar.gz"
		material-companion.desktop
		material-companion
		pipx-fix.patch)
sha256sums=('b05b33f603e8632eaba47203457935dd728bd2d5223462e699dbe4add37d9538'
            'ffd52de96b51e26aef5044413c311d19f829514f5463342eebcf3fdcef03f41d'
            '1ccb8679f88551b552c08a8cf11c24fa46d80d9fd6f890722861b59bce210387'
            '1d695effd893e102a13fa528884e1b6bbbe511f7eeac42e701e7ecf6d1a01f92')
prepare() {
  cd "MaterialCompanion-$pkgver"
  patch -p1 -i "$srcdir/pipx-fix.patch"
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
