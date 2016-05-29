# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=wxtoimg-beta
_pkgname=wxtoimg
pkgver=2.11.2
pkgrel=1
pkgdesc="Software to decode APT and WEFAX signals from weather satellites"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="http://www.wxtoimg.com/"
license=('custom')
depends=('alsa-lib' 'libxft')
conflicts=('wxtoimg' 'xwxtoimg')
provides=('wxtoimg' 'xwxtoimg')
case "$CARCH" in
	x86_64)
		source=("http://wxtoimg.com/beta/$_pkgname-linux-amd64-$pkgver-beta.tar.gz")
		md5sums+=('1edac1717864a69b23b8c599532ddd96')
		;;
	i686)
		source=("http://wxtoimg.com/beta/$_pkgname-linux-i386-$pkgver-beta.tar.gz")
		md5sums+=('38f0d2b508e6d47f53a765bdf27df094')
		;;
	armv6h|armv7h)
		source=("http://wxtoimg.com/beta/$pkgname-linux-armhf-$pkgver-beta.tar.gz")
		md5sums+=('c6956c97ad0c88a888f32e973ba1b139')
		;;
esac
DLAGENTS='http::/usr/bin/wget -c -t 3 --waitretry=3 -O %o %u' 

package() {
	mkdir -p ../pkg/$pkgname/usr/bin
	mkdir -p ../pkg/$pkgname/usr/lib/$pkgname
	mv etc ../pkg/$pkgname/usr/lib/$pkgname/
	mv usr/local/bin/* ../pkg/$pkgname/usr/bin/
	install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	ln -snf /usr/bin/$_pkgname ../pkg/$pkgname/usr/bin/xwxtoimg
}
