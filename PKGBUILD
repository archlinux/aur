# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Hoàng Đức Hiếu <hdh@lazny.tang.la>
# Contributor: Gilfran Ribeiro <contato [at] gilfran [dot] net>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=cpyrit-cuda-svn
pkgver=308
pkgrel=1
pkgdesc="CUDA backend for accelerated attack against WPA-PSK authentication. (SVN version)"
url="http://code.google.com/p/pyrit/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('pyrit-svn' 'nvidia-utils' 'python2') 
makedepends=('cuda' 'svn')
conflicts=('cpyrit-calpp-svn' 'cpyrit-calpp' 'cpyrit-cuda' 'cpyrit-opencl')
provides=('cpyrit-cuda')

source=("svn+http://pyrit.googlecode.com/svn/trunk/cpyrit_cuda")
md5sums=('SKIP')

pkgver() {
	cd cpyrit_cuda

	svnversion
}

build() {
	cd cpyrit_cuda

	sed "s|' --host-compilation C'||" -i setup.py
	python2 setup.py build
}

package() {
	cd cpyrit_cuda

	python2 setup.py install --root="${pkgdir}" --optimize=1
}
