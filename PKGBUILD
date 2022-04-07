# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Atterratio <atterratio@gmail.com>

pkgname=q4wine-git
pkgver=1.3.13.2.g9735939
pkgrel=1
pkgdesc="A Qt GUI for Wine. (GIT Version)"
arch=('x86_64')
url='http://sourceforge.net/projects/q4wine'
license=('GPL3')
depends=('qt-solutions-git'
         'icoutils'
         'wine'
         'which'
         'desktop-file-utils'
         'hicolor-icon-theme'
         )
makedepends=('cmake'
             'git'
             'qt5-tools'
             'qt5-svg'
             'fuseiso'
             )
optdepends=('winetricks: Tweak wine'
            'fuseiso: Mount ISO files'
            )
conflicts=('q4wine')
provides=('q4wine')
source=('git+https://github.com/brezerk/q4wine.git')
sha1sums=('SKIP')

pkgver() {
  cd q4wine
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cmake -S q4wine -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBS_ENTRY_PATH=/usr/lib \
    -DWITH_SYSTEM_SINGLEAPP=ON

  cmake --build build
}

package() {

  DESTDIR="${pkgdir}" cmake --install build

  rm -fr "${pkgdir}/usr/share/icons/ubuntu-mono-dark"
}
