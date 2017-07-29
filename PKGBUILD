# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=smooth
pkgver=0.8.73.0_pre3
pkgrel=1
pkgdesc="An object oriented C++ class library for Windows, OS X, Linux and most Unix-like operating systems"
arch=('i686' 'x86_64')
url="http://www.smooth-project.org/"
license=('Artistic2.0')
depends=('fribidi' 'gtk3' 'libjpeg-turbo' 'libxmu' 'curl')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver/_/-}/${pkgname}-${pkgver/_/-}.tar.gz" "glib2-include.patch")
sha512sums=('74e29fc394cbf8e9169c06fb9a6f7978c3c541243200b58cb5a7d9813234d182161eb220211445933e36d4c3344e1c80aa2543018c78e080338bf93b1c7f9c1b'
            'cd2a48192fb6a1564088fc3179c953f0ed4112308dfa7347a3e536d4df561a8312f0ce1e607e9b4c865c5cec67612bf91e91f25e5d96c72d7b8829d834179028')

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
