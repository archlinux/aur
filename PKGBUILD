# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=smooth
pkgver=0.8.73.0_pre2
pkgrel=1
pkgdesc="An object oriented C++ class library for Windows, OS X, Linux and most Unix-like operating systems"
arch=('i686' 'x86_64')
url="http://www.smooth-project.org/"
license=('Artistic2.0')
depends=('fribidi' 'gtk3' 'libjpeg-turbo' 'libxmu' 'curl')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver/_/-}/${pkgname}-${pkgver/_/-}.tar.gz" "glib2-include.patch")
sha512sums=('1d64be4775c6bc12bc7a4f4bda0b84b695512d5344ee1c0e859ba8b417d2532df73a6bb9b7c5b43a713832ac5bf7ed0460ac4b377b759469ed674976c83b9ce0'
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
