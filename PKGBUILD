# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=firefox-esr-extension-plasma-integration
pkgver=2.0
pkgrel=1
pkgdesc='KDE plasma browser integration extension for firefox ESR'
arch=('any')
url="https://invent.kde.org/plasma/plasma-browser-integration"
license=("CC0-1.0 AND GPL-2.0-or-later AND GPL-3.0-or-later AND MIT")
makedepends=("web-ext" "jq")
groups=('firefox-esr-addons')
source=("$url/-/archive/browser/$pkgver/plasma-browser-integration-browser-$pkgver.tar.gz")
sha1sums=('caddac71f4b9ed18ee8dbe4650d8b4209ce61eae')

build(){
  cd "$srcdir/plasma-browser-integration-browser-$pkgver/extension"
  web-ext build -a dist
}

package(){
  cd "$srcdir/plasma-browser-integration-browser-$pkgver/extension"
  
  depends=('firefox-esr' 'plasma-browser-integration')

  local id && id=$(jq -r .browser_specific_settings.gecko.id manifest.json)
  msg2 "Firefox extension id is $id"
  install -Dm644 dist/plasma_integration-$pkgver.zip \
    "$pkgdir/usr/lib/firefox-esr/browser/extensions/$id.xpi"
}
