# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname='qmapshack-git'
pkgver=1.20.1.r1.gb418500d
pkgrel=1
pkgdesc='Plan your next outdoor trip'
arch=('x86_64')
url='https://github.com/Maproom/qmapshack/wiki'
license=('GPL3')
depends=(
  'alglib'
  'gdal'
  'glibc'
  'hicolor-icon-theme'
  'libgcc'
  'libjpeg-turbo'
  'libstdc++'
  'proj'
  'qt6-5compat'
  'qt6-base'
  'qt6-declarative'
  'qt6-tools'
  'qt6-webengine'
  'quazip-qt6'
  'routino'
)
makedepends=(
  'clang'
  'cmake'
)

conflicts=('qmapshack')
provides=('qmapshack')
replaces=('qmapshack-hg')
source=("$pkgname::git+https://github.com/Maproom/qmapshack.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    git describe --long --tags  | sed 's/^V_//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S $pkgname -B build -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
