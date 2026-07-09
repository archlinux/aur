# Maintainer: kuro <kuro@kuro.moe>
# Contributor: kuro <kuro@kuro.moe>

pkgname=vicinae-takoba
pkgver=0.1.2
pkgrel=3
pkgdesc="Japanese dictionary, translator, TTS, and Anki integration for launchers — search Jotoba, translate on the fly, add cards to Anki"
arch=('any')
url="https://github.com/kurojs/Takoba"
license=('MIT')
depends=('vicinae-bin' 'nodejs' 'npm')
makedepends=('git' 'npm')
source=("Takoba-$pkgver.tar.gz::https://github.com/kurojs/Takoba/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=takoba.install

build() {
  cd "$srcdir/Takoba-$pkgver"
  npm install
  node scripts/copy-shim.js vicinae
  npx vici build -o dist
  node scripts/copy-dict.js dist
}

package() {
  cd "$srcdir/Takoba-$pkgver"
  install -dm755 "$pkgdir/usr/share/vicinae-takoba"
  install -Dm644 dist/takoba.js "$pkgdir/usr/share/vicinae-takoba/takoba.js"
  install -Dm644 package.json "$pkgdir/usr/share/vicinae-takoba/package.json"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/vicinae-takoba/icon.png"
  install -dm755 "$pkgdir/usr/share/vicinae-takoba/assets"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/vicinae-takoba/assets/icon.png"
  install -dm755 "$pkgdir/usr/share/vicinae-takoba/dict"
  install -m644 dist/dict/*.dat.gz "$pkgdir/usr/share/vicinae-takoba/dict/"
}
