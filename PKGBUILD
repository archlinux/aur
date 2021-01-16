# Maintainer: David Rubio (david.alejandro.rubio at gmail.com)

_pkgname=qqc2-desktop-style
pkgname=qqc2-desktop-style-git
pkgver=r435.64d900d
pkgrel=1
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme - Git Version'
arch=(x86_64)
url='https://invent.kde.org/frameworks/qqc2-desktop-style'
license=(LGPL)
groups=(kf5)
depends=(kirigami-git kiconthemes-git)
makedepends=(extra-cmake-modules)
provides=(qqc2-desktop-style)
conflicts=(qqc2-desktop-style)
source=("git+https://invent.kde.org/frameworks/qqc2-desktop-style.git")
sha256sums=('SKIP')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
