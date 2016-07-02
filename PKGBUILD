# Contributor: FixedTorres <aur_linuxero@outlook.com>
# Maintainer: FixedTorres <aur_linuxero@outlook.com>

_lang=sq
_debrel=1

pkgname=iceweasel-i18n-${_lang}
pkgver=47.0.1
pkgrel=1
pkgdesc="Albanian language package for Iceweasel"
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
sha512sums=('4c36be56cce4849b2e5ca844fcd29c27a455339635bf367787fcf817a60ba4c7f705efd11c1fb154f87ad55ae1e5eecc3fcb97d7eec0fc5d6a9a7e3944beebfd')
sha512sums=('f0aeb39a74b15b94ba5d62ca745ccf34d8d963b2efcb127e3fe554f412357a307d1d6f33c16c4f4b14915035df5ea32e80cab900cc1575cd548f23b6ee9c541a')
