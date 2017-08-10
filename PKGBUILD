# Maintainer: artemtech <sofyanartem@gmail.com>
pkgname=manokwari
pkgver=1.0.13
pkgrel=1
pkgdesc="HTML5 desktop shell for GNOME 3 from BlankOn Projects"
arch=('x86_64')
url="https://manokwari.blankonlinux.or.id"
license=('GPL3')
depends=('gnome-common' 'mutter' 'libunique3' 'gnome-session' 'glib2' 'gtk3' 'libwnck3' 'libgee' 'webkitgtk' 'gnome-menus' 'libnotify')
makedepends=('make' 'git' 'vala')
optdepends=('bromo-gtk-theme: Gtk theme optimized for Manokwari shell'
'tebu-icon-theme: Official icon sets from BlankOn'
'tebu-flat-icon-theme: flat version of tebu-icon from BlankOn')
source=("$pkgname"::"git+https://github.com/BlankOn/manokwari.git")
md5sums=('SKIP')

prepare(){
		cd ${srcdir}/${pkgname}
		sed -i 's/gee-1.0/gee-0.8/g' configure.ac
}

build(){
	cd ${srcdir}/${pkgname}
	./autogen.sh
	make
}

package() {
	cd ${srcdir}/${pkgname}
	make DESTDIR="$pkgdir/" install
	cp -R system/{css/,fonts/,img/,js/,widget/,texture.jpg,texture.xcf} --target-directory=$pkgdir/usr/lib/manokwari/system/
	chmod +x $pkgdir/usr/bin/blankon-session
}
