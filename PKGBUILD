# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-utilrb
_pkgname=orocos-toolchain
pkgver=2.5.0
pkgrel=1
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (Ruby toolkit)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
depends=('ruby' 'ruby-nokogiri')
makedepends=('ruby-hoe')
source=(http://www.orocos.org/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2)
md5sums=('cb817efca78ae5659a3ca62a741e43bf')

build() {
	# build utilrb
	cd "${srcdir}/${_pkgname}-${pkgver}/utilrb"
	
	sed 's/$LDFLAGS/#$LDFLAGS/g' -i ext/extconf.rb
	
	# this mimics what the rakefile does
	cd ext
	ruby extconf.rb
	make
}

package() {
	# install utilrb
	cd "${srcdir}/${_pkgname}-${pkgver}/utilrb"
	
	_libdir=`ruby -r rbconfig -e 'printf("%s",RbConfig::CONFIG["rubylibdir"])'`
	
	install -dm755 "${pkgdir}${_libdir}"
	cp -dr --no-preserve=ownership lib/* "${pkgdir}${_libdir}"
	cp -dr --no-preserve=ownership ext/utilrb_ext.so "${pkgdir}${_libdir}/utilrb_ext.so"
}

