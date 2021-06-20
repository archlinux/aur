# Maintainer: tytan652 <tytan652@tytanium.xyz>
_pluginname=text-pthread
pkgname=obs-$_pluginname
pkgver=1.0.1
_obsver=27.0.0
pkgrel=1
pkgdesc="This plugin aims to show beautiful texts on OBS Studio"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-pthread-text.1287/"
license=("GPL2")
depends=("obs-studio>=$_obsver" "pango")
makedepends=("cmake")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/norihiro/obs-text-pthread/archive/$pkgver.tar.gz"
)
sha256sums=(
  "f6fb63b4a76d6473f8030e7ff410ea9c7d271562d32da66aea495e153adbcc17"
)

# Need to compile plugin in OBS compilation process
build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DCMAKE_INSTALL_PREFIX=/usr

  make -C build
}

package() {
  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$pkgdir" install
}
