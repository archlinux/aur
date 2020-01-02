# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=nasc
pkgver=0.5.4
pkgrel=1
pkgdesc='Do maths like a normal person.'
arch=('i686' 'x86_64')
url='https://parnold-x.github.io/nasc/'
license=('GPL3')
depends=('libqalculate' 'granite' 'libgee' 'gtksourceview3' 'libsoup' 'cln')
optdepends=()
makedepends=('vala' 'git' 'cmake')
conflicts=('nasc-git' 'nasc-bzr')
source=("https://github.com/parnold-x/nasc/archive/${pkgver}.tar.gz" fix-gcc9-build.patch)
sha512sums=('ef06185182fc071adafe188a890e4751fdb515dda8ad87704203ba8dc123ede5d1e759031c1256581415bea3e31e4748f5235b94a15e1cbe21a19789d1763694'
            '0eacced70c0d831d07a7fa5199bd26f3b2fe3802bfd5038ce85240c2aff7c3223e52fa6b3d52dc4a35793c6c30cc796b9a797fed030c2f6f01462ecc2571a319')

prepare () {
	cd "${pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/fix-gcc9-build.patch"
}

build () {
	cd "${pkgname}-${pkgver}"
	rm -rf build
	mkdir -p build
	cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DGSETTINGS_COMPILE=OFF -DCMAKE_BUILD_TYPE=Release ..
	make
}

package () {
	cd "${pkgname}-${pkgver}/build"
	make install DESTDIR="${pkgdir}"
}
