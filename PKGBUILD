pkgname=bricscad-en_us
pkgver=20.2.11
pkgrel=1
pkgdesc="Alternative to CAD number DWG"
arch=("x86_64")
url="https://www.bricsys.com"
license=('Custom:bricscad')
depends=(lib32-glibc  cairo lib32-fontconfig libcups lib32-freetype2 lib32-gtk2)
_lang=en_US
provides=('bricscad')
#optdepends=()

# To download you must be logged in. The official website has no permanent link.
source=("file://BricsCAD-V${pkgver}-en_US.x86_64.rpm")

#validpgpkeys=()

# build() {
	# cd "$pkgname-$pkgver"
	# ./configure --prefix=/usr
	# makepkg
# }

package() {
	cp -dr --no-preserve=ownership ./usr "${pkgdir}"/
	cp -dr --no-preserve=ownership ./opt "${pkgdir}"/
	cp -dr --no-preserve=ownership ./var "${pkgdir}"/
}

post_install(){
	if [ "$1" = "configure" ] && [ -x "`which update-menus 2>/dev/null`" ]; then
    update-menus
fi

if [ "$1" = "configure" ] && [ -x "`which update-desktop-database 2>/dev/null`" ]; then
    update-desktop-database /usr/share/applications/
fi

if [ "$1" = "configure" ] && [ -x "`which update-mime-database 2>/dev/null`" ]; then
    update-mime-database /usr/share/mime    
fi

if [ "$1" = "configure" ] && [ -x "`which gtk-update-icon-cache 2>/dev/null`" ] && [ -x /usr/share/icons/gnome/index.theme ]; then
    gtk-update-icon-cache --force /usr/share/icons/gnome
fi

if [ "$1" = "configure" ] && [ -x "`which locale-gen 2>/dev/null`" ]; then
    locale-gen ${_lang}
fi
}
post_remove(){
	if [ -x "`which update-menus 2>/dev/null`" ]; then update-menus ; fi

if [ -x "`which update-desktop-database 2>/dev/null`" ]; then update-desktop-database /usr/share/applications/ ; fi

if [ -x "`which update-mime-database 2>/dev/null`" ]; then update-mime-database /usr/share/mime ; fi

if [ -x "`which gtk-update-icon-cache 2>/dev/null`" ] && [ -x /usr/share/icons/gnome/index.theme ]; then gtk-update-icon-cache --force /usr/share/icons/gnome ; fi

}
md5sums=('4b245d920e5f21501519c12e9ee7a260')
