pkgname=gtk3-libwinmenu
pkgver=1
pkgrel=3
pkgdesc="Gtk+ module to hide menubar by default"
arch=('i686' 'x86_64')
url='http://www.linux.org.ru/jump-message.jsp?msgid=5606544&cid=5617512'
license=('custom')
depends=('gtk3')
source=('libwinmenu.c' 'Makefile'
        winmenu.sh
        use_ctrl_right.patch
        add_arandr_whitelist.patch
        update_to_gtk3.patch)
md5sums=('20a2e4823e8d2baf1e33de97335a040b' 'bea7864ffb1fe89ed61160b31b58f528'
         5e28dd91b09c3503759c3c960b8f2322
         eb9d4660537a95689066f84b0563dbb9
         effe0ea4178afb25d9d98538855b0a18
         e6d3240baee4f4c7189b30d6dedcbc74)

prepare() {
	cd "$srcdir"
	patch -Np1 --follow-symlinks -i use_ctrl_right.patch
	patch -Np1 --follow-symlinks -i add_arandr_whitelist.patch
	patch -Np1 --follow-symlinks -i update_to_gtk3.patch
}

build() {
	cd "$srcdir"
	make
}

package() {
	cd "$srcdir"
	install -Dm755 libwinmenu.so "$pkgdir/usr/lib/gtk-3.0/modules/libwinmenu.so"
	install -Dm755 winmenu.sh "$pkgdir/etc/X11/xinit/xinitrc.d/35-winmenu.sh"
}
