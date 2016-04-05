# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=plasma5-applets-yahoo-weather-widget
pkgver=5.1.0
pkgrel=1
pkgdesc="A simple weather widget that makes use of beloved Yahoo! Weather data"
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php/Yahoo%21+Weather+Widget?content=164194"
_watch="lynx -dump -listonly "https://github.com/librehat/com.librehat.yahooweather/tags" | sed -n 's|.*archive/v\([5-9].*\).tar.gz|\1|p' | head -1"
license=(GPL)
depends=(plasma-workspace qt5-declarative)
makedepends=(extra-cmake-modules)
source=("https://github.com/librehat/com.librehat.yahooweather/archive/v$pkgver.tar.gz")
md5sums=('17bd3327fa711fc0ec2addd58f2c95d5')

prepare() {
  cd com.librehat.yahooweather-$pkgver
  mkdir -p build
}

build() {
  cd com.librehat.yahooweather-$pkgver/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd com.librehat.yahooweather-$pkgver/build
  make DESTDIR="$pkgdir" install
}
