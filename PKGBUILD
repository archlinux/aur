# Maintainer: Jacopo Antonello <jack at antonello dot org>

pkgname=hdf-compass-git
_gitname=hdf-compass
pkgver=0.6.0.57.g4d6367e
pkgrel=1
pkgdesc="Python-based viewer for HDF5 on other file formats; hdf-view replacement"
arch=(i686 x86_64)
url="https://github.com/HDFGroup/hdf-compass.git"
depends=('python2' 'python2-numpy' 'python2-matplotlib' 'wxpython' 'python2-h5py' 'python2-requests')
makedepends=('git')
provides=('hdf-compass')
conflicts=('hdf-compass')
source=("git://github.com/HDFGroup/hdf-compass.git")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --tags | sed -e 's:v::' -e 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
}

package() {
	mkdir -p "${pkgdir}/opt/hdf-compass"
	cp -afv hdf-compass/* "${pkgdir}/opt/hdf-compass"
	chown -R root:root "${pkgdir}/opt/hdf-compass"

  install -D -m755 ../hdf-compass.sh "${pkgdir}/usr/bin/hdf-compass"
}
