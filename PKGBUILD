# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='firefox-extension-privacy-redirect'
pkgver=1.1.46
pkgrel=1
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('GPL3')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/privacy-redirect/archive/v$pkgver.tar.gz")
b2sums=('2b5f14a8657513493a456f2db63f1167e8cc5016e9c7f3e9034166c3a9ed5844abf93c3f98ba5921bc0629e004ebd84505ee33f1eb94dbbfc5f4d48a5b475ca0')

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
