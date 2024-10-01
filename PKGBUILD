# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
 
pkgname=vvave-git
pkgver=4.0.0.r4.g31b7bf2
pkgrel=1
pkgdesc="Music player for KDE"
arch=(x86_64 i686 armv7h aarch64)
url="https://vvave.kde.org/"
license=(LGPL-3.0-only)
groups=(maui)
depends=(mauikit-git mauikit-filebrowsing-git taglib)
makedepends=(git cmake extra-cmake-modules mauikit-accounts-git)
optdepends=('gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs')
provides=(vvave)
conflicts=(vvave)
source=("git+https://invent.kde.org/kde/vvave.git")
sha256sums=('SKIP')

pkgver() {
  cd "vvave"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "vvave" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
