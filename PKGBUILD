# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

pkgname=ola-git
pkgver=0.10.6.r1355.g671e66b85
pkgrel=1

python="python"
# uncomment for python2 libs
# python="python2"

pkgdesc="The Open Lighting Architecture (OLA) provides a plugin framework for distributing DMX512 control signals on Mac and Linux"
arch=('i686' 'x86_64')
url="https://www.openlighting.org/ola/"
license=('LGPL2.1' 'GPL2')

makedepends=('git' 'liblo' 'avahi' 'libusb' 'libusb-compat' 'libftdi-compat' 'flex' 'bison' "${python}" "${python}-protobuf")
depends=('libmicrohttpd' 'cppunit' 'protobuf')
optdepends=('liblo' 'libftdi-compat' 'libusb' 'openslp' 'avahi' "${python}-protobuf")

provides=('ola')
conflicts=('ola')

source=("git+https://github.com/OpenLightingProject/ola.git")
# uncomment for 0.10.6
# source=("git+https://github.com/OpenLightingProject/ola.git#tag=0.10.6")
sha256sums=('SKIP')

_gitname="ola"

pkgver() {
	cd $_gitname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_gitname
	autoreconf -i
	PYTHON=$python ./configure \
		--prefix=/usr \
		--enable-python-libs \
		--disable-unittests
	make
}

package() {
	cd $_gitname
	make DESTDIR="${pkgdir}" install
}
