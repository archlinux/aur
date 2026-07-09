# Maintainer: kuro <kuro@kuro.moe>
# Contributor: kuro <kuro@kuro.moe>

pkgname=vicinae-kotoba
pkgver=1.1.1
pkgrel=1
pkgdesc="Japanese dictionary, translator, and Anki integration for Vicinae — search Jotoba, translate sentences, add cards to Anki"
arch=('any')
url="https://github.com/kurojs/Takoba"
license=('MIT')
depends=('vicinae-bin' 'nodejs' 'npm')
makedepends=('git' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kurojs/Takoba/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=takoba.install

build() {
  cd "$srcdir/Takoba-$pkgver"
  npm install
  node scripts/copy-shim.js vicinae
  npx vici build -o dist
}

package() {
  cd "$srcdir/Takoba-$pkgver"
  install -dm755 "$pkgdir/usr/share/vicinae-kotoba"
  install -Dm644 dist/takoba.js "$pkgdir/usr/share/vicinae-kotoba/takoba.js"
  install -Dm644 dist/package.json "$pkgdir/usr/share/vicinae-kotoba/package.json"
  install -Dm644 dist/assets/icon.png "$pkgdir/usr/share/vicinae-kotoba/icon.png"
  install -dm755 "$pkgdir/usr/share/vicinae-kotoba/assets"
  install -Dm644 dist/assets/icon.png "$pkgdir/usr/share/vicinae-kotoba/assets/icon.png"
}
