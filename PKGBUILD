# Maintainer: ninian <mcfadzean.org.uk ta linux>

pkgname=dmenu-xyw-mouse-msel
pkgver=4.6
pkgrel=3
pkgdesc="Dynamic X menu - with x, y, width, line height, and mouse support"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft' 'freetype2')
conflicts=('dmenu')
provides=('dmenu')
source=("http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz"
        "http://tools.suckless.org/dmenu/patches/dmenu-xyw-$pkgver.diff"
        "http://tools.suckless.org/dmenu/patches/dmenu-mousesupport-$pkgver.diff"
        "http://tools.suckless.org/dmenu/patches/dmenu-lineheight-$pkgver.diff")
sha256sums=('4a7a24008a621c3cd656155ad91ab8136db8f0d3b9ec56dafeec518cabda96b3'
            '70494bbc9df5c65101646a2a3040b1784c0d5db882aa185e2015dc035c550d70'
            '001558bb7f6eeefce4a5b11bda93dc04e0981413b1bfbc3c5c1b05059bf51289'
            '81a57a268c9b96f8fb3586f981fe60ec4889aa858d36cd2d521ae36b2903ae7d')

prepare() {
	cd $srcdir/dmenu-$pkgver
	patch -p1 < ../dmenu-xyw-$pkgver.diff
	patch -p1 < ../dmenu-mousesupport-$pkgver.diff
	patch -p1 -F 3 < ../dmenu-lineheight-$pkgver.diff
}

build() {
	cd $srcdir/dmenu-$pkgver
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
	cd "$srcdir/dmenu-$pkgver"
	make DESTDIR=$pkgdir PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
