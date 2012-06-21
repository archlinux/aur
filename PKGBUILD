# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-orogen
_pkgname=orocos-toolchain
pkgver=2.5.0
pkgrel=1
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (oroGen)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
depends=('orocos-typelib' 'orocos-utilrb')
source=(http://www.orocos.org/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2)
md5sums=('cb817efca78ae5659a3ca62a741e43bf')

build() {
	# build orogen
	cd "${srcdir}/${_pkgname}-${pkgver}/orogen"
	
	RUBYLIB="${srcdir}/${_pkgname}-${pkgver}/orogen/lib" rake
}

package() {
	# install orogen
	cd "${srcdir}/${_pkgname}-${pkgver}/orogen"
	
	_libdir=`ruby -r rbconfig -e 'printf("%s",RbConfig::CONFIG["rubylibdir"])'`
	
	install -dm755 "${pkgdir}${_libdir}"
	cp -dr --no-preserve=ownership lib/* "${pkgdir}${_libdir}"
	
	install -dm755 "${pkgdir}/usr/bin"
	cp -dr --no-preserve=ownership bin/* "${pkgdir}/usr/bin"
}

