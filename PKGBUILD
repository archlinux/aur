# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=lightfirefox
pkgver=47.0
_pkgver=${pkgver%%.*}
pkgrel=1
pkgdesc="A light Firefox edition"
url="http://sourceforge.net/projects/lightfirefox"
license=('MPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'gtk3' 'libxt' 'mime-types' 'nss' 'shared-mime-info')
provides=("${pkgname}=${_pkgver}")
install=${pkgname}.install
arch=('i686' 'x86_64')
source_x86_64=("${pkgname/firefox}-${pkgver}.en-US.linux-x86_64.rpm::http://sourceforge.net/projects/${pkgname}/files/${_pkgver}/201606060706_gcc/${pkgname/firefox}-${pkgver}.en-US.linux-x86_64.rpm/download")
md5sums_x86_64=('6ccd5a704e583111230efe5d73b15b7c')

source_i686=("${pkgname/firefox}-${pkgver}.en-US.linux-i686.rpm::http://sourceforge.net/projects/${pkgname}/files/${_pkgver}/201606060709_gcc32/${pkgname/firefox}-${pkgver}.en-US.linux-i686.rpm/download")
md5sums_i686=('368b8af71d0791cb65ab12592e857eb2')

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
