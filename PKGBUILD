pkgname=firefox-esr-extension-download-with-aria2
pkgver=4.8.3.2538
pkgrel=1
pkgdesc='The Aria2 Download Manager for Firefox.'
arch=('any')
url='https://github.com/jc3213/download_with_aria2'
license=('LGPL-2.1')
depends=('firefox-esr')
makedepends=('jq')
groups=('firefox-esr-addons')
source=("$pkgname::git+https://github.com/jc3213/download_with_aria2#tag=$pkgver")
sha512sums=('SKIP')

build() {
  cd "$pkgname"
  sh linux_build.sh firefox
}

package() {
  install -Dm644 $pkgname/build/firefox/$pkgver.xpi "${pkgdir}/usr/lib/firefox-esr/browser/extensions/$(jq -j '.browser_specific_settings.gecko.id' $pkgname/firefox/manifest.json).xpi"
}
