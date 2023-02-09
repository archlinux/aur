# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
 
pkgname=mauikit-git
pkgver=2.2.1.r61.ge15ec89a
pkgrel=2
pkgdesc='Utilities and "templated" controls based on Kirigami and QCC2 that follow the ongoing work on the Maui HIG'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://mauikit.org/"
license=(GPL3)
groups=(maui)
depends=(qt5-base qt5-declarative  qt5-quickcontrols2 knotifications ki18n mauiman-git)
makedepends=(git cmake extra-cmake-modules qt5-webengine appstream syntax-highlighting plasma-framework)
provides=(mauikit)
conflicts=(mauikit)
source=("git+https://invent.kde.org/kde/mauikit.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}
 
package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
