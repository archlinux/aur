# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: TheCynicalLiger
# Contributor: Lerentis <lerentis@burntbunch.org>

pkgname=index-fm-git
pkgver=4.0.0.r5.g44a6c1b
pkgrel=1
pkgdesc="Index is a file manager that works on desktops, Android and Plasma Mobile"
arch=(x86_64 i686 armv7h aarch64)
url="https://invent.kde.org/maui/index-fm"
license=(BSD-2-Clause CC0-1.0 LGPL-3.0-only)
depends=(mauikit-git mauikit-filebrowsing-git qmltermwidget)
makedepends=(git cmake extra-cmake-modules)
provides=(index-fm)
conflicts=(index-fm)
source=("git+https://invent.kde.org/maui/index-fm.git")
sha256sums=('SKIP')

pkgver() {
  cd "index-fm"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "index-fm" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  cd "index-fm/LICENSES"
  install -D BSD-2-Clause.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
