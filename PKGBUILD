# Maintainer: Kezi <keziolio123@gmail.com>

pkgname=openems-project-git
pkgver=0.0.35
pkgrel=1
pkgdesc="free and open electromagnetic field solver using the FDTD method."
arch=('any')
url="http://openems.de/"
license=('GPL3')
groups=()
depends=('cmake' 'qt5-base' 'tinyxml' 'hdf5' 'boost' 'vtk' 'unixodbc' 'cgal' 'openmpi')
makedepends=('git')
provides=('openems-git')
conflicts=('openems' 'openems-git')
replaces=()
backup=()
options=()
install=
source=("${pkgname%-VCS}::git+https://github.com/thliebig/openEMS-Project.git")
noextract=()
md5sums=('SKIP')

_gitname="openEMS-Project"

build() {
    cd "$srcdir/${pkgname%-VCS}"
    git submodule init
    git submodule update

    ./update_openEMS.sh "$srcdir/${pkgname%-VCS}/openems_path" --with-MPI
}

package() {
  cd "$srcdir/${pkgname%-VCS}/openems_path"
  mkdir -p $pkgdir/usr/
  cp -R * $pkgdir/usr/
}

