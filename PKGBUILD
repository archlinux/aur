# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Atterratio <atterratio@gmail.com>

pkgname=q4wine-git
pkgver=1.4.1.15.gf506d89
pkgrel=1
pkgdesc="A Qt GUI for Wine. (GIT Version)"
arch=('x86_64')
url='https://github.com/brezerk/q4wine'
license=('GPL3')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so
  'qt6-base' # libQt6Core.so libQt6DBus.so libQt6Gui.so libQt6Network.so libQt6Sql.so libQt6Widgets.so libQt6Xml.so
  'icoutils'
  'wine'
  'which'
  'hicolor-icon-theme'
)
makedepends=(
  'cmake'
  'git'
  'qt6-tools'
  'qt6-svg'
  'fuseiso'
)
optdepends=(
  'winetricks: Tweak wine'
  'fuseiso: Mount ISO files'
)
conflicts=('q4wine')
provides=(
  'q4wine'
  'libq4wine-core.so'
)
source=('git+https://github.com/brezerk/q4wine.git')
sha256sums=('SKIP')

pkgver() {
  cd q4wine
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cmake -S q4wine -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBS_ENTRY_PATH=/usr/lib \
    -DUSE_GZIP=ON \
    -DQT6=ON

  cmake --build build
}

package() {

  DESTDIR="${pkgdir}" cmake --install build

  rm -fr "${pkgdir}/usr/share/icons/ubuntu-mono-dark"
}
