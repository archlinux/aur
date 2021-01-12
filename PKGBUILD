# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='firefox-extension-privacy-redirect'
pkgver=1.1.45
pkgrel=1
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('GPL3')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/privacy-redirect/archive/v$pkgver.tar.gz")
b2sums=('ae01d053deee5589b64b6cd85ae79455a61a15d54df928ff10e7215548c1ef850ff1595728fe74c6d59ab60a25624f3d77580657495e43c4dbd13b373fa89168')

prepare() {
  cd "privacy-redirect-$pkgver"
  npm install
  npm audit fix
}

build() {
  cd "privacy-redirect-$pkgver"
  npm run build
}

package() {
  cd "privacy-redirect-$pkgver/web-ext-artifacts"
  install -Dm644 "privacy_redirect-$pkgver.zip" "$pkgdir/usr/lib/firefox/browser/extensions/{b7f9d2cd-d772-4302-8c3f-eb941af36f76}.xpi"
}
# vim:set sw=2 et:
