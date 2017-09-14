# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="libodf-template"
pkgver=1.7
pkgrel=1
pkgdesc="A simple library for templating odf documents"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/nullptrT/libodf-template"
license=('LGPL3')
provides=('libodf-template')
depends=('zip' 'unzip')
source=("git://github.com/nullptrT/libodf-template.git#tag=v${pkgver}")
md5sums=('SKIP')
makedepends=('cmake' 'git')


prepare() {
	cd "$srcdir"
	[[ -e build ]] && rm -r build
	mkdir build
}


build() {
	cd "$srcdir/build"

	cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
   		-DODF_TEMPLATE_SHARED=1 \
		-DODF_TEMPLATE_INSTALL_LIBS=ON \
		"../libodf-template"

	make
}


package() {
	cd "$srcdir/build"
	make DESTDIR="${pkgdir}" install
}
