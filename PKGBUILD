# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='libdazzle'
pkgdesc='Companion library to GObject and GTK+'
license=('GPL3')
pkgver='3.26.0'
pkgrel=1
conflicts=('libdazzle-git')
makedepends=('meson' 'gobject-introspection' 'vala' 'gtk-doc')
depends=('gtk3')
arch=('x86_64' 'i686')
url='https://github.com/chergert/libdazzle'
source=("https://git.gnome.org/browse/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.xz")
sha512sums=('36555d1ede6a21deb35af6b13a48ebb4a650aad556402d523b0468eaac5cf64b1d77c722315c3cbe5fd327ea244b3cb0c041d0a43ab192ea7aec2e0644da281c')


build () {
	cd "${pkgname}-${pkgver}"
	rm -rf build
	meson --buildtype release  \
		--prefix /usr \
		--sysconfdir /etc \
		--localstatedir /var \
		-Denable_gtk_doc=true \
		-Dwith_introspection=true \
		-Dwith_vapi=true \
		build 
	ninja -C build
}

package () {
	DESTDIR="${pkgdir}" ninja -C "${pkgname}-${pkgver}/build" install
}
