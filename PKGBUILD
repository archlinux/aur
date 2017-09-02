# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=smooth
pkgver=0.8.73.0_pre4
pkgrel=1
pkgdesc="An object oriented C++ class library for Windows, OS X, Linux and most Unix-like operating systems"
arch=('i686' 'x86_64')
url="http://www.smooth-project.org/"
license=('Artistic2.0')
depends=('fribidi' 'gtk3' 'libjpeg-turbo' 'libxmu' 'curl')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver/_/-}/${pkgname}-${pkgver/_/-}.tar.gz" "glib2-include.patch")
sha512sums=('e46da62421ae049d72ac247ff5c46f9734d52a4dd69582b3c225fc16001fa3eaa6fcaafcd4d9062eb2cc1d597e07595867b23b99ca266d0e7ef1db04bc153ba2'
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
