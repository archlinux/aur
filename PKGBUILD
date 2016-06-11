# Contributor: FixedTorres <aur_linuxero@outlook.com>
# Maintainer: FixedTorres <aur_linuxero@outlook.com>

_Lang=gu-IN
_lang=gu-in
_debrel=1

pkgname=iceweasel-i18n-${_lang}
pkgver=47.0
pkgrel=1
pkgdesc="Gujarati language pack for Iceweasel (India)"
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
sha512sums=('ae1d3564a45f621dffc781e5109783b989ec7cd20fb7dfe32816d27fe118d7904fe988f150ea7bdac173f504399d659cefe6f414777ef4ac0551aad338faa53b')
