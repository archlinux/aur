# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=xdgmenumaker
pkgver=1.1
pkgrel=1

pkgdesc="xdgmenumaker creates generating menus using xdg information for blackbox, compizboxmenu, fluxbox, icewm, jwm, pekwm and windowmaker."
url="https://github.com/gapan/$pkgname"

arch=('any')
license=('GPLv3')
depends=('pygtk' 'pygobject-devel' 'gobject-introspection' 'python-gobject' 'python-xdg')
optdepends=('txt2tags: for manpages')
source=("https://github.com/gapan/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('df104e5580f9f1ff7505ef606d2ff5cde7413755becd60378a7f9c74faca77c6c1a7be5f9b2251f7e7e1290960549aeddaccb79eb1fc936cd85de59546e4b5e0')

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

