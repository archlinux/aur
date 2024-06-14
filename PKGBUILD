pkgname=paraview-medreader
pkgver=9.12.0
pkgrel=1
pkgdesc="ParaView MEDReader plugin"
license=('LGPL')
arch=('x86_64')
url="https://docs.salome-platform.org/latest/dev/PARAVIS/"
depends=('paraview' 'medcoupling')
makedepends=('cmake' 'fast_float')
source=("git+https://git.salome-platform.org/gitpub/modules/paravis.git#tag=V9_12_0"
        "git+https://git.salome-platform.org/gitpub/tools/configuration.git#tag=V9_12_0")
sha256sums=('SKIP')
sha256sums=('SKIP' 'SKIP')
       
prepare() {
  cd paravis/
  sed -i "s|lib/salome|lib|g" src/Plugins/MEDReader/plugin/MEDLoaderForPV/CMakeLists.txt
  sed -i "s|\${MEDCoupling_medloader}|medloader|g" src/Plugins/MEDReader/plugin/MEDLoaderForPV/CMakeLists.txt
}

build() {
  cd paravis/src/Plugins/MEDReader
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCONFIGURATION_ROOT_DIR="${srcdir}"/configuration -S src/Plugins/MEDReader .
  make
}

package() {
  cd paravis/src/Plugins/MEDReader
  make DESTDIR="$pkgdir" install
}

