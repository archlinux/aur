# Por falta de tempo, alguns programas podem estar desatualizados. Mas aqueles que desejam co-manter são bem-vindos.
# A Bricsys não fornece um link permanente, mesmo que você entre em contato.
# Para usar, faça o download em https://www.bricsys.com/protected/download.do e coloque-o na pasta do PKGBUILD.

pkgname=bricscad-pt_br
pkgver=20.2.11
pkgrel=1
pkgdesc="É uma alternativa de CAD DWG número, oferecendo um recurso completo e reconhecível, conjunto para usuários profissionais. BricsCAD lê e grava o formato DWG e oferece alta compatibilidade com o AutoCAD"
arch=("x86_64")
url="https://www.bricsys.com"
license=('Custom:bricscad')
depends=(lib32-glibc  cairo lib32-fontconfig libcups lib32-freetype2 lib32-gtk2)

# To download you must be logged in. The official website has no permanent link.
source=("file://BricsCAD-V20.2.11-1-pt_BR.x86_64.rpm")


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
# MD5 Provido pela propria BricsCAD
md5sums=('19ac20550567e2cbb3a6021c6b0f8987')
sha512sums=('69c1393bd43d1353d31dec012294e046595b900f4f689adc112efa12cf3af92dacfb9b8b0aff1fb48d82895eb1d72fb8300c5b7fcc75e1145c434bc0fd6d0877')
b2sums=('44c70c2f8d49fe4991e644bd94c3aa0b33f22af7a9ec343b185a0b168f61c1430b264a2cea80ab7722bd9d4f6e4bbb30da44ca06647f58cd057288240484420c')
