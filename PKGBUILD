# Maintainer: Thanos Apostolou <thanosapostolou@outlook.com>

pkgname=gnome-shell-extension-windowoverlay-icons
pkgver=33
pkgrel=2
pkgdesc="Adds application icons to the windows overview (in Activities menu)"
arch=('any')
url="https://github.com/sustmi/gnome-shell-extension-windowoverlay-icons"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('07dd842ac5b79bf9d3b730b574d83a6ee54c65cd6ad115a65fc384913b724ad3')


build() {
	cd "$pkgname-$pkgver"
	make locales
}

package() {
	cd "$pkgname-$pkgver"
	install -d "${pkgdir}/usr/share/gnome-shell/extensions/windowoverlay-icons@sustmidown.centrum.cz"
	install -d "${pkgdir}/usr/share/locale"
	
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/schemas/org.gnome.shell.extensions.windowoverlay-icons.gschema.xml" \
	               "${pkgdir}/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.windowoverlay-icons.gschema.xml"
    cp -r "${srcdir}/${pkgname}-${pkgver}/locale"/* \
	      "${pkgdir}/usr/share/locale/"
	cp -r "${srcdir}/${pkgname}-${pkgver}"/* \
	      "${pkgdir}/usr/share/gnome-shell/extensions/windowoverlay-icons@sustmidown.centrum.cz/"
    rm -rf "${pkgdir}/usr/share/gnome-shell/extensions/windowoverlay-icons@sustmidown.centrum.cz"/{locale,schemas,po,COPYING,Makefile,README.md}
}
