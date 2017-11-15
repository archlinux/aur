# Maintainer: Adrián Pérez de Castro
pkgname='woff2'
pkgdesc='Web fonts compression reference code'
pkgver='1.0.2'
pkgrel='2'
url='https://github.com/google/woff2'
license=('Apache')
arch=('i686' 'x86_64')
depends=('brotli>=1.0.1')
makedepends=('cmake')
conflicts=('woff2-git')
source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz"
        'cmake-install-tools.patch')
sha512sums=('c788bba1530aec463e755e901f9342f4b599e3a07f54645fef1dc388ab5d5c30625535e5dd38e9e792e04a640574baa50eeefb6b7338ab403755f4a4e0c3044d'
            '31342cea2b8efd17e105905471238709fe91e40fa3b4ff29cfe17ee04a6ef0f60fd425496834fd2601b0a7fbb2e0af8582f873d8e9c583bac4915f0ff3fe62cc')

prepare () {
	cd "${pkgname}-${pkgver}"
	patch -p2 < "${srcdir}/cmake-install-tools.patch"
}

build () {
	rm -rf build
	mkdir build
	cd build
	cmake -G 'Unix Makefiles' \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=/usr/lib \
		-DINSTALL_TOOLS=ON \
		"${srcdir}/${pkgname}-${pkgver}"
	make
}

package () {
	cd build
	make DESTDIR="${pkgdir}" install
}
