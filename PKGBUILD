# Contributor: FixedTorres <aur_linuxero@outlook.com>
# Maintainer: FixedTorres <aur_linuxero@outlook.com>

_lang=gl
_debrel=1

pkgname=iceweasel-i18n-${_lang}
pkgver=47.0.1
pkgrel=1
pkgdesc="Galician language pack for Iceweasel"
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
sha512sums=('ee55723fd85599d97935d61a63d8cd69d9e30a263343fa831f77f98bd8f73357eb7f1d4318b1035564d80d76ba03654a4059f085ceb6f349bbf5856ce4cbeefc')
sha512sums=('0283241a1c8be51898017b9c6a34e170d3aa6f2dcc612dd677659dee2e90fc1c68576344a84d7fbeeecb82f26fcf49e1d2b474a4b825dfcabe016b7d9bbe4601')
