# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
pkgname=xglfs
pkgver=0.0.1
pkgrel=1
pkgdesc="GlusterFS API FUSE client"
arch=('x86_64')
url="https://github.com/gluster/${pkgname}"
license=('GPL3')
depends=('acl' 'attr' 'fuse' 'glibc' 'glusterfs' 'libutil-linux' 'openssl' 'zlib')
optdepends=('gperftools: faster memory allocation with tcmalloc')
makedepends=('git' 'gcc' 'cmake' 'make' 'fuse' 'glusterfs')

source=("${pkgname}-git::git+https://github.com/gluster/${pkgname}.git")

sha256sums=("SKIP")

build() {
	cd "${srcdir}/${pkgname}-git"

	mkdir -p build
	cd build

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
	make -j$(nproc)
}

package() {
	cd "${srcdir}/${pkgname}-git/build"
	make install
}

