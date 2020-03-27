pkgname=bibleanalyzer
pkgver=5.2
pkgrel=1
pkgdesc="Bible Analyzer - Bible Study and Analysis Software"
arch=("any")
url="http://www.bibleanalyzer.com"
license=('Custon:bibleanalyzer')
depends=("python>=2.7" "python2-wxpython3" "python2-pillow>=3.1" "python2-espeak>=0.3" "python2-configobj>=4.7" "xsel" "gst-plugins-ugly")

source=("https://www.bibleanalyzer.com/bibleanalyzer_5.2-1_all.deb")


package() {
	tar -xf data.tar.xz -C "${pkgdir}"/
	install -Dm644 "$pkgdir/usr/share/doc/bibleanalyzer/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
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
md5sums=('9cdc55b5ffade3f31264772699a58405')
sha512sums=('cb9aa86c4f3cd5bdfbdc78a41c021a31e3cd25256e44911b9e5e02c2d62121d7686524678a25c7d8c03dff478bf4c96df37d02748009480ccd9c79e099a4abe0')
