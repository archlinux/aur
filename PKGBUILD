# Maintainer: Dmitry Nosachev <quartz64@gmail.com>
# Contributor: Dmitry Nosachev <quartz64@gmail.com>

pkgname=ipmicfg
pkgver=1.29.0
_pkghash=181029
pkgrel=1
pkgdesc="Supermicro IPMI configuration tool"
makedepends=('unzip')
depends=("glibc")
arch=('x86_64' 'i686')
license=('custom:"Super Micro Computer"')
url="http://www.supermicro.com/products/nfo/ipmi.cfm"
source=("ftp://ftp.supermicro.com/utility/IPMICFG/IPMICFG_${pkgver}_build.${_pkghash}.zip")
sha256sums=('7b0b22cdad03822e4d5919a9073f324466f93784919d11cafc6c600668118b9d')

package() {
	cd ${srcdir}/IPMICFG_${pkgver}_build.${_pkghash}/Linux

	mkdir -p ${pkgdir}/opt
	mkdir -p ${pkgdir}/usr/bin

	if [ "${CARCH}" = "x86_64" ]; then
		cp -rf 64bit ${pkgdir}/opt/${pkgname}
		chmod a+rx ${pkgdir}/opt/${pkgname}/IPMICFG-Linux.x86_64
		ln -s /opt/${pkgname}/IPMICFG-Linux.x86_64 ${pkgdir}/usr/bin/${pkgname}
	elif [ "${CARCH}" = "i686" ]; then
		cp -rf 32bit ${pkgdir}/opt/${pkgname}
		chmod a+rx ${pkgdir}/opt/${pkgname}/IPMICFG-Linux.x86
		ln -s /opt/${pkgname}/IPMICFG-Linux.x86 ${pkgdir}/usr/bin/ipmicfg
	fi
}


