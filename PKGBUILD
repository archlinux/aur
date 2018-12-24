# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=wxtoimg
pkgver=2.10.11
pkgrel=1
pkgdesc="Software to decode APT and WEFAX signals from weather satellites"
arch=('x86_64' 'i686')
url="https://www.wxtoimgrestored.xyz"
license=('custom')
depends=('libx11' 'sh')
conflicts=('wxtoimg' 'xwxtoimg')
provides=('wxtoimg' 'xwxtoimg')
case "$CARCH" in
	x86_64)
		source=("https://wxtoimgrestored.xyz/downloads/$pkgname-linux64-$pkgver-1.tar.gz")
		md5sums+=('773dcad83ac853e7ea622debcd99478d')
		;;
	i686)
		source=("https://wxtoimgrestored.xyz/downloads/$pkgname-linux-$pkgver.tar.gz")
		md5sums+=('278b7dc098188beec20bde2169162279')
		;;
esac
DLAGENTS='http::/usr/bin/wget -c -t 3 --waitretry=3 -O %o %u' 

package() {
	mkdir -p ../pkg/$pkgname/usr/lib/$pkgname
	mkdir -p ../pkg/$pkgname/usr/bin
	mv etc ../pkg/$pkgname/usr/lib/$pkgname/
	mv usr/local/bin/* ../pkg/$pkgname/usr/bin/
	install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	ln -nfs /usr/bin/$pkgname ../pkg/$pkgname/usr/bin/xwxtoimg
}
