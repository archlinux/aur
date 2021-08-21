# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: TheCynicalLiger
# Contributor: Lerentis <lerentis@burntbunch.org>

pkgname=index-fm-git
pkgver=2.0.0.r7.g5db75df
pkgrel=1
pkgdesc="Index is a file manager that works on desktops, Android and Plasma Mobile"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/maui/index-fm"
license=(GPL3)
depends=(mauikit mauikit-filebrowsing qmltermwidget)
makedepends=(git cmake extra-cmake-modules)
provides=(index-fm)
conflicts=(index-fm)
source=("git+https://invent.kde.org/maui/index-fm.git")
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
  make DESTDIR="${pkgdir}" install
}
