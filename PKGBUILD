# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=xdgmenumaker
pkgver=0.9
pkgrel=1

pkgdesc="xdgmenumaker creates generating menus using xdg information for blackbox, compizboxmenu, fluxbox, icewm, jwm, pekwm and windowmaker."
url="https://github.com/gapan/$pkgname"

arch=('any')
license=('GPLv3')
depends=('pygtk' 'pygobject-devel' 'gobject-introspection' 'python-gobject' 'python-xdg')
optdepends=('txt2tags: for manpages')
source=("https://github.com/gapan/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('802a11cafefc3ab8e411685da04a9687b33b57efe67a93b42de43d95039489dca5fe110d6642995b241d382e1b2ee65e06a0bd548ae31ed5d1aeb243dd96c645')

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

