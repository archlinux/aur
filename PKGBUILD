# Maintainer: Adrián Pérez de Castro
pkgname='woff2'
pgkdesc=''
pkgver='1.0.1'
pkgrel='1'
url='https://github.com/google/woff2'
license=('Apache')
arch=('i686' 'x86_64')
depends=('brotli>=1.0.1')
conflicts=('woff2-git')
source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz"
        'cmake-install-tools.patch')
sha512sums=('d3257164e004e3319001a6e7015050b894ecff751da01a1f2eea226f0730f142c6001b04a959af2e16546a63fab216706b32b0d543cade210ecd54fa70f6e55c'
            '31342cea2b8efd17e105905471238709fe91e40fa3b4ff29cfe17ee04a6ef0f60fd425496834fd2601b0a7fbb2e0af8582f873d8e9c583bac4915f0ff3fe62cc')

prepare () {
	patch -p1 < cmake-install-tools.patch
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
