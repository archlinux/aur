# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=ola-git
pkgver=0.9.5.r406.gaad3ac0
pkgrel=1
pkgdesc="The Open Lighting Architecture (OLA) provides a plugin framework for distributing DMX512 control signals on Mac and Linux"
arch=('i686' 'x86_64')
url="https://www.openlighting.org/ola/"
license=('LGPL2.1' 'GPL2')
provides=('ola')
makedepends=('git')
depends=('libmicrohttpd' 'cppunit' 'protobuf' 'python2-protobuf' 'python2')
optdepends=('liblo' 'avahi' 'libusb' 'libusb-compat' 'libftdi-compat' 'openslp')
conflicts=('ola')
source=("git+https://github.com/OpenLightingProject/ola.git")
# uncomment for 0.9.5
#source=("git+https://github.com/OpenLightingProject/ola.git#tag=0.9.5")
sha256sums=('SKIP')

_gitname="ola"

pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_gitname}"
	autoreconf -i
	# since protobuf isnt ported to python 3 we have to choose python 2 
	PYTHON=python2 ./configure --prefix=/usr --enable-python-libs --disable-unittests --disable-fatal-warnings
	make
}

package() {
	make -C "${srcdir}/${_gitname}" DESTDIR="${pkgdir}" install
}
