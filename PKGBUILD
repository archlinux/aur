# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>

pkgname=lightfirefox
pkgver=40.0
pkgrel=2
pkgdesc="A light Firefox edition"
url="http://sourceforge.net/projects/lightfirefox"
license=('MPL')
makedepends=('rpmextract')
depends=('gtk2' 'desktop-file-utils' 'nss' 'libxt' 'dbus-glib' 'alsa-lib')
optdepends=('gtk3: GTK+3 support')
install=${pkgname}.install
arch=('i686' 'x86_64')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver/.0}/${pkgname/firefox}-${pkgver}.en-US.linux-${CARCH}.rpm")
if [[ "${CARCH}" == "x86_64" ]]; then
  md5sums=('927e53b46000a8ff0742a818f1a33e04')
elif [[ "${CARCH}" == "i686" ]]; then
  md5sums=('98064521207befade9440dc75a85a3e9')
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
