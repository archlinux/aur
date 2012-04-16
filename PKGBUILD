# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

pkgname=dmenu
pkgver=4.5
pkgrel=2
pkgdesc="A generic menu for X"
url="http://tools.suckless.org/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('sh' 'libxinerama' 'libxft' 'freetype2')
source=("http://dl.suckless.org/tools/$pkgname-$pkgver.tar.gz"
	"http://tools.suckless.org/dmenu/patches/dmenu-$pkgver-xft.diff")
md5sums=('9c46169ed703732ec52ed946c27d84b4'
         'd448ec9120718b0aedbdb338f4fa69ba')

build(){
  cd $srcdir/$pkgname-$pkgver
  patch -p1 <$srcdir/dmenu-$pkgver-xft.diff
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 XFTINC=-I/usr/include/freetype2
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
