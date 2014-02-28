# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Hoàng Đức Hiếu <hdh@lazny.tang.la>
# Contributor: Gilfran Ribeiro <contato [at] gilfran [dot] net>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=cpyrit-opencl-svn
pkgver=308
pkgrel=1
pkgdesc="OpenCL backend for accelerated attack against WPA-PSK authentication. (SVN version)"
url="http://code.google.com/p/pyrit/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('pyrit-svn' 'python2')
makedepends=('opencl-headers' 'svn')
optdepends=('opencl-nvidia: OpenCL implemention for NVIDIA'
            'opencl-catalyst: OpenCL implemention from AMD')
conflicts=('cpyrit-calpp-svn' 'cpyrit-calpp' 'cpyrit-opencl' 'cpyrit-cuda')
provides=('cpyrit-opencl')

source=("svn+http://pyrit.googlecode.com/svn/trunk/cpyrit_opencl")
md5sums=('SKIP')

pkgver() {
	cd cpyrit_opencl

	svnversion
}

prepare() {
	cd cpyrit_opencl

	# fix path headers
	sed -i 's|/usr/local/opencl/OpenCL/common/inc|/usr/include/CL|g' setup.py
}

build() {
	cd cpyrit_opencl

	python2 setup.py build
}

package() {
	cd cpyrit_opencl

	python2 setup.py install --root="${pkgdir}" --optimize=1
}
