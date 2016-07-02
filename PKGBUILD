# Contributor: FixedTorres <aur_linuxero@outlook.com>
# Maintainer: FixedTorres <aur_linuxero@outlook.com>

_Lang=es-AR
_lang=es-ar
_debrel=1

pkgname=iceweasel-i18n-${_lang}
pkgver=47.0.1
pkgrel=1
pkgdesc="Spanish language pack for Iceweasel (Argentina)"
arch=('any')
url="https://wiki.debian.org/it/Iceweasel"
license=('MPL' 'GPL')
depends=("iceweasel>=$pkgver")
makedepends=('unzip' 'zip')
source=("http://ftp.debian.org/debian/pool/main/f/firefox/firefox-l10n-${_lang}_${pkgver}-${_debrel}_all.deb")

package() {
	msg2 "Installing Language Pack..."
	tar Jxvf "${srcdir}"/data.tar.xz -C "${srcdir}"/

	cd "${srcdir}"/usr/lib/firefox/browser/extensions
	unzip "langpack-${_Lang}@firefox.mozilla.org.xpi"
	rm "langpack-${_Lang}@firefox.mozilla.org.xpi"
	
	sed -i -e 's/Mozilla Firefox/Iceweasel/' browser/chrome/$_Lang/locale/branding/brand.dtd
	sed -i -e 's/Mozilla Firefox/Iceweasel/' browser/chrome/$_Lang/locale/branding/brand.properties
	sed -i '9,$d' browser/chrome/$_Lang/locale/branding/brand.dtd
	sed -i '9,$d' browser/chrome/$_Lang/locale/branding/brand.properties
	sed -i -e 's/firefox/iceweasel/' install.rdf
	sed -i 's|Firefox|Iceweasel|g' $(grep -rlI 'Firefox' "$srcdir")
	sed -i 's|Iceweasel|Firefox|' chrome/$_Lang/locale/$_Lang/global/aboutRights.dtd
	rm -rv chrome/$_Lang/locale/$_Lang/global-platform/{mac,win}
	
	zip -r langpack-${_Lang}@iceweasel.mozilla.org.xpi .
	install -vDm755 "langpack-${_Lang}@iceweasel.mozilla.org.xpi" "$pkgdir/usr/lib/iceweasel/browser/extensions/langpack-${_Lang}@iceweasel.mozilla.org.xpi"

	
}
sha512sums=('e4f8e7568657e44a24af32afd3ea3e529cda5ab35f0281e74a9d778b13bdcf86391dc673a8bbbdadf925e93e7cf39eff36bce484adf530f7490b8264675b47eb')
