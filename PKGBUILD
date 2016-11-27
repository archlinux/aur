# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=xdgmenumaker
pkgver=1.3
pkgrel=1
pkgdesc="xdgmenumaker creates generating menus using xdg information for blackbox, compizboxmenu, fluxbox, icewm, jwm, pekwm and windowmaker."
url="https://github.com/gapan/$pkgname"
arch=('any')
license=('GPLv3')
depends=('pygtk' 'pygobject-devel' 'gobject-introspection' 'python-gobject' 'python-xdg')
optdepends=('txt2tags: for manpages')
source=("https://github.com/gapan/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9583ddcf9e0bc66d762d829d6d33b995306847f403f1139bcfa596250858cb525fab89f0a9f9bf13fc24565266fb09569c227414ebb840e437cf8733236a4687')
whirlpoolsums=('78c1d094568e9e8dc846f7096421c5ce2ebd2b2be5068a19180e80b4923827d8119179fa4963ff2cb215fcd0b62f68942e72e15ab6d0a6631ffe869f7d8e8966')

build() {
	cd "$pkgname-$pkgver"
   make
}

package() {
    cd "$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/local/share/desktop-directories
   make DESTDIR="$pkgdir/" install
   ## begin fix for depreciated /usr/local install location ##
   mkdir -p $pkgdir/usr/bin
   mv $pkgdir/usr/local/bin/xdgmenumaker $pkgdir/usr/bin
   rm -rf $pkgdir/usr/local/bin
}

