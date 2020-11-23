# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='firefox-extension-privacy-redirect'
pkgver=1.1.43
pkgrel=1
pkgdesc="Redirect Youtube, Twitter, Instagram, ... to privacy friendly alternatives"
license=('MIT')
arch=('any')
url="https://github.com/SimonBrazell/privacy-redirect"
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SimonBrazell/privacy-redirect/archive/v$pkgver.tar.gz")
b2sums=('1dae67d1d20468a0ef3d1895e7f2b6cef09cd4c943ed02c569342d2d742e34d11ab5e869be8d53a81978cbaf8dec31059c32b3d37852153c2f62eb928de6a026')

prepare() {
  npm install web-ext
}

build() {
  cd "$srcdir/privacy-redirect-$pkgver"
  "$srcdir/node_modules/web-ext/bin/web-ext" build
}

package() {
  cd "$srcdir/privacy-redirect-$pkgver"
  install -Dm644 "web-ext-artifacts/privacy_redirect-$pkgver.zip" "$pkgdir/usr/lib/firefox/browser/extensions/{b7f9d2cd-d772-4302-8c3f-eb941af36f76}.xpi"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set sw=2 et:
