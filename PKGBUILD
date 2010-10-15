# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gtk-chtheme
pkgver=0.3.1
pkgrel=6
pkgdesc="This little program lets you change your Gtk+ 2.0 theme. A better alternative to switch2"
arch=('i686' 'x86_64')
license=('GPL')
url="http://plasmasturm.org/programs/gtk-chtheme/"
depends=('gtk2')
source=(http://plasmasturm.org/programs/gtk-chtheme/${pkgname}-${pkgver}.tar.bz2)
md5sums=('f688053bf26dd6c4f1cd0bf2ee33de2a')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	# Fix xdg compliancy
	sed -i 's|-DGTK.*||' Makefile
	sed -i 's|theme_list(g_.*|&\n\tread_theme_list(g_strconcat(g_get_user_data_dir(), "/themes", NULL));|' main.c
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm755 gtk-chtheme ${pkgdir}/usr/bin/gtk-chtheme || return 1
}
