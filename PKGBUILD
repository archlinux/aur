# Contributor: FixedTorres <aur_linuxero@outlook.com>
# Maintainer: FixedTorres <aur_linuxero@outlook.com>

_Lang=es-ES
_lang=es-es
_debrel=1

pkgname=iceweasel-i18n-${_lang}
pkgver=47.0.1
pkgrel=1
pkgdesc="Spanish language package for Iceweasel"
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
sha512sums=('0d08c8f1413533779443aa6505fed454214639e2d88624c5880fb79488bf8bfcb815d619428130d8e6efcb6ce377a6099935ad10e3c52f479fb3b0f942cdfc11')
