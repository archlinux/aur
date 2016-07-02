# Contributor: FixedTorres <aur_linuxero@outlook.com>
# Maintainer: FixedTorres <aur_linuxero@outlook.com>

_lang=or
_debrel=1

pkgname=iceweasel-i18n-${_lang}
pkgver=47.0.1
pkgrel=1
pkgdesc="Oriya language pack for Iceweasel"
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
sha512sums=('b5474f771cae7d5fcbfbc39a33c1ddd4c594b149e6e1bebf36a8b43f9fdc0e6d276fb46134065042f5bf19b00990e423bd412200b017d1be2a9e5ceed1f36544')
sha512sums=('03a3b7ade48466e1ce39959e3caa4f92581b20a3e076a0530cd20239255e92fb42304014e4179ec2a8d74a9f7cd5b0d229796cef21da8abef6e3e2edb295f738')
