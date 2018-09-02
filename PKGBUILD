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
source=()
noextract=()
md5sums=()


_gitroot="https://github.com/thliebig/openEMS-Project.git"
_gitname="openEMS-Project"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --recursive "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone --recursive "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"


  ./update_openEMS.sh "$srcdir/$_gitname-build/openems_path" --with-MPI
}

package() {
  cd "$srcdir/$_gitname-build/openems_path"
  mkdir -p $pkgdir/usr/
  cp -R * $pkgdir/usr/

}

# vim:set ts=2 sw=2 et:
