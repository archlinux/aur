pkgname="firedragon-extension-plasma-integration"
pkgver=2.2.1
pkgrel=1
pkgdesc="KDE plasma browser integration extension for FireDragon"
arch=("any")
url="https://community.kde.org/Plasma/Browser_Integration"
license=("GPL-3.0-or-later")
makedepends=("web-ext" "jq")
source=("https://invent.kde.org/plasma/plasma-browser-integration/-/archive/browser/$pkgver/plasma-browser-integration-browser-$pkgver.tar.gz")
sha256sums=('80efc8aed850bed2e35b3f6487d2d14fa7ef133d505f667430fc17a21adb67f4')

build() {
  cd "$srcdir/plasma-browser-integration-browser-$pkgver/extension"
  web-ext build -a dist
}
package() {
  depends=("plasma-browser-integration" "firedragon")
  cd "$srcdir/plasma-browser-integration-browser-$pkgver/extension"
  local id=$(jq -r .applications.gecko.id manifest.json)
  echo "Firefox extension id is $id"
  install -Dm644 dist/plasma_integration-$pkgver.zip \
    "$pkgdir/usr/lib/firedragon/browser/extensions/$id.xpi"
}
