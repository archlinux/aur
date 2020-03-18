# I am not responsible for the program, I just packaged it for Arch.
# If you find an error, or want to add something, feel free to get in touch.

pkgname=bricscad-pt_br
pkgver=19.2.15
pkgrel=1
pkgdesc="É uma alternativa de CAD DWG número, oferecendo um recurso completo e reconhecível, conjunto para usuários profissionais. BricsCAD lê e grava o formato DWG e oferece alta compatibilidade com o AutoCAD"
arch=("x86_64")
url="https://www.bricsys.com"
license=('Custon:bricscad')
depends=(lib32-glibc  cairo lib32-fontconfig libcups lib32-freetype2 lib32-gtk2)

source=("BricsCAD-V19.2.15-1-pt_BR.x86_64.rpm::https://www.bricsys.com/DownloadInstallset.download?t=b068t1cXEL&i=5693&if=17334&accept=true&ref=null")

package() {
	cp -dr --no-preserve=ownership ./usr "${pkgdir}"/
	cp -dr --no-preserve=ownership ./opt "${pkgdir}"/
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
md5sums=('6bed041a939437b100fbcf20af21973b')
sha512sums=('ca15a5117bf631200a5852d98abf706533f2dfc469fcf4704f10714518e20a312d6d30b485c3b64dd2119e34e836925b8097a97dcb52fd0061c4cf07d06bbad5')
