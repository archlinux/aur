# Submitter: Thanos Apostolou <thanosapostolou@outlook.com>
# Maintainer: gilbus <aur(AT)tinkershell.eu>
pkgname=gnome-shell-extension-windowoverlay-icons
pkgver=34
pkgrel=2
pkgdesc="Adds application icons to the windows overview (in Activities menu)"
arch=('any')
url="https://github.com/sustmi/gnome-shell-extension-windowoverlay-icons"
license=('GPL3')
depends=('gnome-shell')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('594c3a419234ed8b0c3ccb140ee77f7931a0164fd8d64b35c65cfbadec24fe6c')


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
