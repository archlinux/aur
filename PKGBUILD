# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=rtags-git
pkgver=v2.0.r699.g737b04e
pkgrel=1
pkgdesc="RTags is a client/server application that indexes C/C++ code."
arch=('i686' 'x86_64')
url="https://github.com/Andersbakken/rtags"
license=('GPL3')
depends=('bash' 'clang')
makedepends=('cmake' 'git' 'llvm' 'zlib')
optdepends=('bash-completion: for bash completion' 'zlib')
provides=('rtags')
conflicts=('rtags')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd rtags
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd rtags
	git submodule init
	git submodule update
}

build() {
	cd rtags
	cmake . \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd rtags
	make DESTDIR="${pkgdir}/" install
}
