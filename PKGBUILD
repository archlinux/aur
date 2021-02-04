# Maintainer: tytan652 <tytan652@tytanium.xyz>
_pluginname=SceneSwitcher
pkgname=obs-advanced-scene-switcher
pkgver=1.9
_obsver=26.1.2
pkgrel=1
pkgdesc="An automated scene switcher for OBS Studio"
arch=('x86_64')
url="https://github.com/WarmUpTill/SceneSwitcher"
license=("GPL2")
depends=("obs-studio" "libxss")
makedepends=("cmake")
source=(
  "$pkgname-$pkgver.tar.gz"::"https://github.com/WarmUpTill/$_pluginname/archive/$pkgver.tar.gz"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=(
  'SKIP'
  'bc8b4c61ba4aae87b70c589a6a5b8538e4f03121b31e9b98a2071d9f6006b897'
)

build() {
  cd "$_pluginname-$pkgver"
  cmake -B build \
  -DLIBOBS_INCLUDE_DIR=../obs-studio-$_obsver/libobs \
  -DLIBOBS_FRONTEND_INCLUDE_DIR=../obs-studio-$_obsver/UI/obs-frontend-api \
  -DLIBOBS_FRONTEND_API_LIB='/usr/lib' \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DBUILD_OUT_OF_TREE=1
  make -C build
}

package() {
  cd "$_pluginname-$pkgver"
  make -C build DESTDIR="$pkgdir/" install
}