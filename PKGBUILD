# Maintainer: Your Name <youremail@domain.com>
_pkgname=libtxc_dxtn
pkgname=lib32-$_pkgname
pkgver=1.0.1
pkgrel=1
pkgdesc="the S3TC algorithm, needed by wine-staging DXTn patches"
arch=('x86_64')
url="http://dri.freedesktop.org/wiki/S3TC"
license=('BSD')
depends=('lib32-mesa')
provides=('lib32-libtxc_dxtn')
source=("http://people.freedesktop.org/~cbrill/$_pkgname/$_pkgname-$pkgver.tar.bz2")
md5sums=('7105107f07ac49753f4b61ba9d0c79c5')

build() {

 	export CC='gcc -m32'
 	export CXX='g++ -m32'
  	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr --libdir=/usr/lib32
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	rm "$pkgdir/usr/include" -Rf 
}

