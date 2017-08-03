# Maintainer: Dmitry Nosachev <quartz64@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
_pkgnamecaps=IPMICFG
pkgver=1.27.0_build.170620
pkgrel=1
pkgdesc="Supermicro IPMI configuration tool"
makedepends=('unzip')
depends=("glibc")
arch=('x86_64' 'i686')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("ftp://ftp.supermicro.com/utility/${_pkgnamecaps}/${_pkgnamecaps}_${pkgver}.zip")
sha256sums=('2d32b644e4eb809b2fd9b45b6cf514fb962fb8d1cd69660a29f82b3e6dcf9056')

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


