# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=lightfirefox
pkgver=42.0
_pkgver=42
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
	md5sums=('7ef6a53af0473f6f2f61f2750b25fe53')
elif [[ "${CARCH}" == "i686" ]]; then
	md5sums=('12616880597e1bcb5f3973376bd35d19')
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
