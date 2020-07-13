pkgname=bricscad-pt_br
pkgver=20.2.07
pkgrel=1
pkgdesc="É uma alternativa de CAD DWG número, oferecendo um recurso completo e reconhecível, conjunto para usuários profissionais. BricsCAD lê e grava o formato DWG e oferece alta compatibilidade com o AutoCAD"
arch=("x86_64")
url="https://www.bricsys.com"
license=('Custom:bricscad')
depends=(lib32-glibc  cairo lib32-fontconfig libcups lib32-freetype2 lib32-gtk2)
#optdepends=()

# To download you must be logged in. The official website has no permanent link.
source=("file://BricsCAD-V20.2.07-1-pt_BR.x86_64.rpm")

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
    locale-gen pt_BR
fi
}
post_remove(){
	if [ -x "`which update-menus 2>/dev/null`" ]; then update-menus ; fi

if [ -x "`which update-desktop-database 2>/dev/null`" ]; then update-desktop-database /usr/share/applications/ ; fi

if [ -x "`which update-mime-database 2>/dev/null`" ]; then update-mime-database /usr/share/mime ; fi

if [ -x "`which gtk-update-icon-cache 2>/dev/null`" ] && [ -x /usr/share/icons/gnome/index.theme ]; then gtk-update-icon-cache --force /usr/share/icons/gnome ; fi

}
md5sums=('29e8dc66897ae5840e4ab3658c6fa933')
sha512sums=('beeab769abbda8fa19136173f8e7c0fa426bd5f0fdebe8909b2a5269501bd2a9c1d5e796d737746af0d708b3abcd598ccbdb3a2643c65c5b38c87e75ab2e86b8')

