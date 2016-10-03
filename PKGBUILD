# Maintainer: Dmitry Nosachev <quartz64@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
_pkgnamecaps=IPMICFG
pkgver=1.24.1_build.160222
pkgrel=1
pkgdesc="Supermicro IPMI configuration tool"
makedepends=('unzip')
depends=("glibc")
arch=('x86_64' 'i686')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("ftp://ftp.supermicro.com/utility/${_pkgnamecaps}/${_pkgnamecaps}_${pkgver}.zip")
sha256sums=('469aea7f450f35e0e24c57766b44eacfa8ff68ed30c9be42db5eeaf8c796075f')

package() {
	cd ${srcdir}/${_pkgnamecaps}_${pkgver}/Linux

	mkdir -p ${pkgdir}/opt
	mkdir -p ${pkgdir}/usr/bin

	if [ "${CARCH}" = "x86_64" ]; then
		cp -rf 64bit ${pkgdir}/opt/${pkgname}
		chmod a+rx ${pkgdir}/opt/${pkgname}/${_pkgnamecaps}-Linux.x86_64
		ln -s /opt/${pkgname}/${_pkgnamecaps}-Linux.x86_64 ${pkgdir}/usr/bin/${pkgname}
	elif [ "${CARCH}" = "i686" ]; then
		cp -rf 32bit ${pkgdir}/opt/${pkgname}
		chmod a+rx ${pkgdir}/opt/${pkgname}/${_pkgnamecaps}-Linux.x86
		ln -s /opt/${pkgname}/${_pkgnamecaps}-Linux.x86 ${pkgdir}/usr/bin/ipmicfg
	fi
}


