# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=lightfirefox
pkgver=41.0
_pkgver=41rc
pkgrel=1
pkgdesc="A light Firefox edition"
url="http://sourceforge.net/projects/lightfirefox"
license=('MPL')
makedepends=('rpmextract')
depends=('gtk2' 'desktop-file-utils' 'nss' 'libxt' 'dbus-glib' 'alsa-lib')
optdepends=('gtk3: GTK+3 support')
install=${pkgname}.install
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/project/${pkgname}/${_pkgver}/${pkgname/firefox}-${pkgver}.en-US.linux-${CARCH}.rpm")
if [[ "${CARCH}" == "x86_64" ]]; then
	md5sums=('bdc7e1a27c3099aa1fb0c9e69e56383b')
elif [[ "${CARCH}" == "i686" ]]; then
	md5sums=('f5dfa9e560f1333cc0cc45d276a28d62')
fi

build()
{
	cd "${srcdir}"
	rpmextract.sh *.rpm
}

package()
{
	cd "${srcdir}/usr/local"

	mkdir -p "${pkgdir}/usr/bin"
	cp -Rv {lib,share}/ "${pkgdir}/usr"
	ln -s /usr/lib/light/light "${pkgdir}/usr/bin/light"
}
