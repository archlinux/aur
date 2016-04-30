# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=lightfirefox
pkgver=46.0
_pkgver=${pkgver%%.*}
pkgrel=1
pkgdesc="A light Firefox edition"
url="http://sourceforge.net/projects/lightfirefox"
license=('MPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'gtk3' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
provides=("${pkgname}=${_pkgver}")
install=${pkgname}.install
arch=('i686' 'x86_64')
source_x86_64=("http://downloads.sourceforge.net/project/${pkgname}/${_pkgver}/${pkgname/firefox}-${pkgver}.en-US.linux-x86_64_r2.rpm")
md5sums_x86_64=('57bc36c550d67aaa36cb7307d602b5f7')

source_i686=("http://downloads.sourceforge.net/project/${pkgname}/${_pkgver}/${pkgname/firefox}-${pkgver}.en-US.linux-i686_r2.rpm")
md5sums_i686=('be6f87622e35878f7465c6aa33847dfd')

# Source file and execute 'checksum' for both checksums
checksum()
{
	wget ${source_x86_64} -O "${pkgname}-x86_64.rpm"
	wget ${source_i686} -O "${pkgname}-i686.rpm"
	echo "md5sums_x86_64=('$(md5sum ${pkgname}-x86_64.rpm | cut -d' ' -f 1)')"
	echo "md5sums_i686=('$(md5sum ${pkgname}-i686.rpm | cut -d' ' -f 1)')"
}

package()
{
	cd "${srcdir}/usr/local"

	mkdir -p "${pkgdir}/usr/bin"
	cp -Rv {lib,share}/ "${pkgdir}/usr"
	ln -s /usr/lib/light/light "${pkgdir}/usr/bin/light"
}
