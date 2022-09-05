# Maintainer: Stephanie Wilde-Hobbs <steph@rx14.co.uk>
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: François Charette <firmicus@gmx.net>

pkgname=xz-static
pkgver=5.2.6
pkgrel=1
pkgdesc='Statically linked library and command line tools for XZ and LZMA compressed files'
arch=('x86_64')
url='https://tukaani.org/xz/'
license=('GPL' 'LGPL' 'custom')
depends=('sh')
options=('staticlibs')
source=("https://tukaani.org/xz/xz-${pkgver}.tar.gz"{,.sig})
sha256sums=('a2105abee17bcd2ebd15ced31b4f5eda6e17efd6b10f921a01cda4a44c91b3a0'
            'SKIP')
validpgpkeys=('3690C240CE51B4670D30AD1C38EE757D69184620')

build() {
	cd ${srcdir}/xz-${pkgver}

	./configure --prefix=/usr \
		--disable-rpath \
		--enable-werror \
    --disable-shared \
    --disable-xz \
    --disable-xzdec \
    --disable-lzmadec \
    --disable-lzmainfo \
    --disable-scripts \
    --disable-doc
	make
}

check() {
	cd ${srcdir}/xz-${pkgver}
	make check
}

package() {
	cd ${srcdir}/xz-${pkgver}
	make DESTDIR=${pkgdir} install

  rm -Rf ${pkgdir}/usr/{bin,include,share,lib/pkgconfig}
}
