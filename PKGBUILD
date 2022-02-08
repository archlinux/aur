# Maintainer: Drommer <drommer@github.com>

_gitname="weather-widget-2"
pkgname=plasma5-applets-weather-widget-2-git
pkgver=r93.9c26dd1
pkgrel=1
pkgdesc="An updated version of the plasma-applet-weather-widget by Kotelnik"
arch=('x86_64')
url="https://github.com/blackadderkate/$_gitname"
license=('GPL')
depends=('plasma-workspace' 'qt5-graphicaleffects' 'qt5-xmlpatterns')
makedepends=('git' 'extra-cmake-modules')
source=("git+$url.git#branch=placeSearch")
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
    cd build

    cmake ../$_gitname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
