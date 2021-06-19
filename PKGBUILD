# Maintainer: Tyler Dence <tyzoid.d@gmail.com>
pkgname=raknet
pkgver=4.081
pkgrel=1
pkgdesc="Cross platform C++ network library"
arch=('i686' 'x86_64')
url="http://www.jenkinssoftware.com/"
license=('BSD')
conflicts=('raknet-3.261')
provides=("raknet=$pkgver")
source=(
	'https://github.com/facebookarchive/RakNet/archive/1a169895a900c9fc4841c556e16514182b75faf8.zip')
sha256sums=('60b53557aa084fb5455c8e2e7efe309738dabe7f9db5c0bc103cf41c8f97c0e0')

build() {
	cd ${srcdir}/RakNet-1a169895a900c9fc4841c556e16514182b75faf8/Source
	g++ -fpermissive -lpthread -fPIC -c *.cpp
	g++ -fpermissive -lpthread -shared -o libraknet.so *.o
}

package() {
	cd ${srcdir}/RakNet-1a169895a900c9fc4841c556e16514182b75faf8/Source

	install -Dm644 libraknet.so ${pkgdir}/usr/lib/libraknet.so

	install -dm755 ${pkgdir}/usr/include/raknet/
	install -m644 *.h ${pkgdir}/usr/include/raknet/

	install -Dm644 ../LICENSE ${pkgdir}/usr/share/licenses/raknet
} 
