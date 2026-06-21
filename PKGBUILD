# Maintainer: kuro <kuro@kuro.moe>
# Contributor: kuro <kuro@kuro.moe>

pkgname=vicinae-kotoba
pkgver=1.0.1
pkgrel=1
pkgdesc="Japanese dictionary, translator, and Anki integration for Vicinae — search Jotoba, translate sentences, add cards to Anki"
arch=('any')
url="https://github.com/kurojs/Kotoba"
license=('MIT')
depends=('vicinae-bin' 'nodejs' 'npm')
makedepends=('git' 'npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kurojs/Kotoba/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=kotoba.install

build() {
  cd "$srcdir/Kotoba-$pkgver"
  npm install
  npm run build -- -o dist
}

package() {
  cd "$srcdir/Kotoba-$pkgver"
  install -dm755 "$pkgdir/usr/share/vicinae-kotoba"
  install -Dm644 dist/kotoba.js "$pkgdir/usr/share/vicinae-kotoba/kotoba.js"
  install -Dm644 package.json "$pkgdir/usr/share/vicinae-kotoba/package.json"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/vicinae-kotoba/icon.png"
  install -dm755 "$pkgdir/usr/share/vicinae-kotoba/assets"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/vicinae-kotoba/assets/icon.png"
}
