# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=plasma6-applets-mawaqit-prayer-times
pkgver=0.7.3
pkgrel=1
pkgdesc="Plasma 6 widget showing prayer times from your mosque on mawaqit.net"
arch=('any')
url='https://github.com/medaminezghal/plasma6-applets-mawaqit-prayer-times'
license=('GPL-3.0-or-later')
depends=('plasma-workspace')
makedepends=('qt6-shadertools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4b4f80b56a10925f5fb4a35e7145606c91a09c9531ae3433d0993d8e4f82aac9')

build() {
  cd "$pkgname-$pkgver"
  ./scripts/build-shaders.sh
}

package() {
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir"/usr/share/plasma/plasmoids
  cp -r package "$pkgdir"/usr/share/plasma/plasmoids/com.github.medaminezghal.mawaqit
  install -Dm644 package/contents/icons/mosque.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/com.github.medaminezghal.mawaqit.svg
  find "$pkgdir"/usr/share/plasma/plasmoids -type d -exec chmod 755 {} +
  find "$pkgdir"/usr/share/plasma/plasmoids -type f -exec chmod 644 {} +
}
