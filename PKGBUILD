# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Hoàng Đức Hiếu <hdh@lazny.tang.la>
# Contributor: Gilfran Ribeiro <contato [at] gilfran [dot] net>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=cpyrit-cuda-git
pkgver=0.5.0.r43.gf0f1913
pkgrel=1
pkgdesc="The famous WPA precomputed cracker, CUDA backend (Git version)"
url="https://github.com/JPaulMora/Pyrit"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('pyrit-git' 'cuda')
makedepends=('git')
provides=('cpyrit-cuda' 'cpyrit-cuda-svn')
conflicts=('cpyrit-cuda' 'cpyrit-cuda-svn')
replaces=('cpyrit-cuda-svn')

source=("git+https://github.com/JPaulMora/Pyrit")
md5sums=('SKIP')

function pkgver() {
	cd Pyrit

	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
	cd Pyrit/modules/cpyrit_cuda

#	sed "s|' --host-compilation C'||" -i setup.py
	python2 setup.py build
}

package() {
	cd Pyrit/modules/cpyrit_cuda

	python2 setup.py install --root="${pkgdir}" --optimize=1
}
