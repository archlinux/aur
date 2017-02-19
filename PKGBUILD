# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=xdgmenumaker
pkgver=1.4
pkgrel=1
pkgdesc="xdgmenumaker creates generating menus using xdg information for blackbox, compizboxmenu, fluxbox, icewm, jwm, pekwm and windowmaker."
url="https://github.com/gapan/$pkgname"
arch=('any')
license=('GPLv3')
depends=('pygtk' 'pygobject-devel' 'gobject-introspection' 'python-gobject' 'python-xdg')
optdepends=('txt2tags: for manpages')
source=("https://github.com/gapan/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('d62c80aeb40de0b41401a13f31a2b733cf2ab673221adbd1b0103425aa4abdd342affc8ef986ef5c0d0ac6091a22f3dba1a03770f934c9396bc4d8be2ba22458')
whirlpoolsums=('9fc50035f74aaf4f4345668004921c2fa38ac7fe439bff7d20987f10efc2a9c672c2c24603ee59481fab811f5fcc75d5f3cc3f1456f646062f8b3519540d5bb9')

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

