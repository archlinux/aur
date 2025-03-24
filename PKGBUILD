# Maintainer: tytan652 <tytan652 at tytanium dot xyz>

_pluginname=durchblick
pkgname=obs-$_pluginname
pkgver=0.5.1
pkgrel=1
pkgdesc="Modular multiview for OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/durchblick.1484/"
license=(GPL-2.0-or-later)
depends=("obs-studio>=28" "glibc" "gcc-libs" "qt6-base")
makedepends=("cmake")
options=('debug')
source=("$_pluginname-$pkgver.tar.gz"::"https://github.com/univrsal/$_pluginname/archive/v$pkgver.tar.gz")
sha256sums=("47a5153ea1944f429c409546b20d5b2ee8510e3532f3c2734b703d2a98dea6a7")

build() {
  cmake -B build -S "$_pluginname-$pkgver" \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations" \
  -Wno-dev

  cmake --build  build
}

package() {
 DESTDIR="$pkgdir" cmake --install build
}
 
