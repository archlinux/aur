# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
 
pkgname=mauikit-git
pkgver=r210.32b20e6
pkgrel=1
pkgdesc='Utilities and "templated" controls based on Kirigami and QCC2 that follow the ongoing work on the Maui HIG'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://mauikit.org/"
license=(GPL3)
depends=(qt5-base qt5-declarative qt5-svg qt5-quickcontrols2 kio)
makedepends=(git cmake extra-cmake-modules qt5-webengine)
provides=(mauikit)
conflicts=(mauikit)
source=("${pkgname}::git+https://github.com/maui-project/mauikit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}
 
package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
