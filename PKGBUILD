# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=smooth
pkgver=0.8.73.0
pkgrel=1
pkgdesc="An object oriented C++ class library for Windows, OS X, Linux and most Unix-like operating systems"
arch=('i686' 'x86_64')
url="http://www.smooth-project.org/"
license=('Artistic2.0')
depends=('fribidi' 'gtk3' 'libjpeg-turbo' 'libxmu' 'curl')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver/_/-}/${pkgname}-${pkgver/_/-}.tar.gz" "glib2-include.patch")
sha512sums=('9bc21f52e3512537b252988965a65df0977e7318c4eb19dfbac143418950257b9b6a3e433fc26745b35f123f8faaab47819788bd2546cbcadbbb3bbf326361f6'
            '5eea3bf95f84ff99bc35af54699f3dc00ff20eb7253a49f5b59fa12e60ee12e269715c54a6f99c380a17cf813d0b08738ce0ecb21c95d33f57e2ca8f56ea0bf1')

prepare() {
	cd "$pkgname-${pkgver/_/-}" || exit 1
	patch -p1 -i "$srcdir/glib2-include.patch"
	find . -type f -exec sed -i 's!/usr/local!/usr!g' {} \;
}

build() {
	cd "$pkgname-${pkgver/_/-}" || exit 1
	make
}

package() {
	cd "$pkgname-${pkgver/_/-}" || exit 1
	make DESTDIR="$pkgdir/" install
}
