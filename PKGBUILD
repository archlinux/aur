# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Leopold Bloom <blinxwang@gmail.com>
# Contributor: Michal Krenek (a.k.a. Mikos) <m.krenek@gmail.com>

pkgname=beignet
pkgver=1.2.0
pkgrel=1
pkgdesc='A GPGPU System for Intel Ivybridge GPUs'
arch=('x86_64')
url="https://01.org/beignet"
license=('LGPL2.1')
depends=('glu' 'llvm' 'mesa' 'ocl-icd')
makedepends=('clang' 'cmake' 'python2')
provides=('opencl-intel' 'opencl-headers' 'opencl-headers12')
conflicts=('opencl-intel' 'opencl-headers' 'opencl-headers12')
source=("https://01.org/sites/default/files/beignet-${pkgver}-source.tar.gz")
sha256sums=('fc7af19efb7596b04510d26c558a576eba3e95e1ef86fd6951213c6a4bf58bff')

#prepare() {
#	cd "${srcdir}/Beignet-${pkgver}-Source/include/CL"
#	rm cl.h cl.hpp cl_d3d10.h cl_d3d11.h cl_dx9_media_sharing.h cl_egl.h cl_ext.h cl_gl.h cl_gl_ext.h cl_platform.h opencl.h
#}

build() {
	mkdir -p "${srcdir}/Beignet-${pkgver}-Source/build"
	cd "${srcdir}/Beignet-${pkgver}-Source/build"
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DCMAKE_BUILD_TYPE=RELEASE \
		-DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2
	make
}

package() {
	cd "${srcdir}/Beignet-${pkgver}-Source/build"
	make DESTDIR="${pkgdir}/" install
}
