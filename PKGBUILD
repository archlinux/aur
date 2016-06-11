# Contributor: FixedTorres <aur_linuxero@outlook.com>
# Maintainer: FixedTorres <aur_linuxero@outlook.com>

_lang=te
_debrel=1

pkgname=iceweasel-i18n-${_lang}
pkgver=47.0
pkgrel=1
pkgdesc="Telugu language pack for Iceweasel"
arch=('any')
url="https://wiki.debian.org/Iceweasel"
license=('MPL' 'GPL')
depends=("iceweasel>=$pkgver")
makedepends=('unzip' 'zip')
source=("http://ftp.debian.org/debian/pool/main/f/firefox/firefox-l10n-${_lang}_${pkgver}-${_debrel}_all.deb")

package() {
	msg2 "Installing Language Pack..."
	tar Jxvf "${srcdir}"/data.tar.xz -C "${srcdir}"/

	cd "${srcdir}"/usr/lib/firefox/browser/extensions
	unzip "langpack-${_lang}@firefox.mozilla.org.xpi"
	rm "langpack-${_lang}@firefox.mozilla.org.xpi"
	
	sed -i -e 's/Mozilla Firefox/Iceweasel/' browser/chrome/${_lang}/locale/branding/brand.dtd
	sed -i -e 's/Mozilla Firefox/Iceweasel/' browser/chrome/${_lang}/locale/branding/brand.properties
	sed -i '9,$d' browser/chrome/${_lang}/locale/branding/brand.dtd
	sed -i '9,$d' browser/chrome/${_lang}/locale/branding/brand.properties
	sed -i -e 's/firefox/iceweasel/' install.rdf
	sed -i 's|Firefox|Iceweasel|g' $(grep -rlI 'Firefox' "$srcdir")
	sed -i 's|Iceweasel|Firefox|' chrome/$_lang/locale/$_lang/global/aboutRights.dtd
	rm -rv chrome/${_lang}/locale/${_lang}/global-platform/{mac,win}
	
	zip -r langpack-${_lang}@iceweasel.mozilla.org.xpi .
	install -vDm755 "langpack-${_lang}@iceweasel.mozilla.org.xpi" "$pkgdir/usr/lib/iceweasel/browser/extensions/langpack-${_lang}@iceweasel.mozilla.org.xpi"

	
}
sha512sums=('dd5e819bd5c91b7047feb88c9b56401cbddbb9c00bdeed665897e70772395df542b4e8cda163f73fe473bb7d775c802379f8d76fb27d28759e03f901f1fa34d7')
