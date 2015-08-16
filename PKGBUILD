# Maintainer: ninian <mcfadzean.org.uk ta linux>
# Patches from: https://github.com/manjaro/packages-community/tree/master/dmenu-manjaro

pkgname=dmenu-xft-wxy-mouse
pkgver=4.5
pkgrel=2
pkgdesc="Dynamic X menu - with xft, width, x, y and mouse support"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft')
conflicts=('dmenu' 'dmenu-xft' 'dmenu2')
provides=('dmenu')
source=("http://dl.suckless.org/tools/dmenu-$pkgver.tar.gz"
        "dmenu-$pkgver-xft-wxy.diff"
        "dmenu-$pkgver-mouse.diff")
sha256sums=('082cd698d82125ca0b3989006fb84ac4675c2a5585bf5bb8af0ea09cfb95a850'
            'f4b30691997ebb60c71f0e97e7ac5fccc4b354fd209c0f0a029e758edd45d6c0'
            '2b8454b88f37032f179f95411c18747ea8a821e6a88a43a3766a61f858738b6c')

prepare() {
	cd $srcdir/dmenu-$pkgver
	patch -p1 < ../dmenu-$pkgver-xft-wxy.diff
	patch -p1 < ../dmenu-$pkgver-mouse.diff
}

build() {
	cd $srcdir/dmenu-$pkgver
	make
}

package() {
	cd "$srcdir/dmenu-$pkgver"
	make DESTDIR=$pkgdir PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
