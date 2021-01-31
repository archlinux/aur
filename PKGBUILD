# Maintainer: tytan652 <tytan652@tytanium.xyz>
_pluginname=SceneSwitcher
pkgname=obs-advanced-scene-switcher
pkgver=1.8.3
_obsver=26.1.0
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
  'ac0460a6c0f8699482f9a707044ef823d5cb34c064582152545eb2b255aba691'
  'c015d9bab1075ecf9c66c066328e291a20ef36880958fb3db6486ebc5ca9c6da'
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