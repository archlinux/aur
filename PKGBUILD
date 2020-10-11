# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Michal Wojdyla <micwoj9292 at gmail dot com>
# Contributor: William Grieshaber <me@zee.li>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Joekey joekey1@gmail.com
pkgname=trigger
pkgver=0.6.6.1
pkgrel=4
pkgdesc="Free OpenGL rally car racing game"
arch=('x86_64' 'aarch64')
url="https://sourceforge.net/projects/trigger-rally/"
license=('GPL2')
conflicts=()
depends=('physfs' 'tinyxml2' 'freealut' 'glu' xdg-utils 'sdl2_image')
makedepends=('glew' 'tinyxml2' 'openal')
install=trigger.install
source=(https://sourceforge.net/projects/trigger-rally/files/$pkgname-$pkgver/$pkgname-rally-$pkgver.tar.gz
	$pkgname.png
	$pkgname.desktop)
sha512sums=('feed805858ef63907bb10088761f1219b22fe55ead268511ef73b18aa0f18d79e87d4e2cbfb76361b1dec3949b59464af33efe31e81f06ae7e163430f3336669'
            'a7ebc8cb714755701b4e9b83cb4773679d1bbdae66ed1bd9dc747474b027fbda31c6e723cf4f910d833b16ae5e354660030dc9c7d86022006ed7f2f0e03c1d14'
            '7127a8279cabbbd3e208c67a0c5e008fdf3721822b74d8eb9ce30bad29acf8875aade79dde3df32e118b00d5ee8e3927cbf287207a028f7a35cd1ae2a4d1dbe2')

build() {
	cd $pkgname-rally-$pkgver/src
	make
}

package() {
	cd $pkgname-rally-$pkgver/src/
	prefix="/usr" exec_prefix="/usr" make DESTDIR=$pkgdir install
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 "${srcdir}/${pkgname}-rally-${pkgver}/doc/COPYING.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
