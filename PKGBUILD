# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='firefox-extension-privacy-redirect'
pkgver=1.1.47
pkgrel=1
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('GPL3')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/privacy-redirect/archive/v$pkgver.tar.gz")
b2sums=('293bcfb3aec279fd79e248bf26f95c1e2ccf34ada54fbc9f464dc345e67d410f11fd1b332dfdbdc79b290df252d36f1532580f52bef924d6cae2ed9a031ff501')

prepare() {
  cd "privacy-redirect-$pkgver"
  npm install
  npm audit fix
}

build() {
  cd "privacy-redirect-$pkgver"
  npm run build
}

check() {
  cd "privacy-redirect-$pkgver"
  npm run test
}

package() {
  cd "privacy-redirect-$pkgver/web-ext-artifacts"
  install -Dm644 "privacy_redirect-$pkgver.zip" "$pkgdir/usr/lib/firefox/browser/extensions/{b7f9d2cd-d772-4302-8c3f-eb941af36f76}.xpi"
}
# vim:set sw=2 et:
