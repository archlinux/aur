# Maintainer: Thomas Hipp <thomashipp (at) gmail (dot) com>

pkgname=glimpse-git
pkgver=2.3.5.r9.g550d6e1
pkgrel=1
pkgdesc='GLIMPSE measurement client.'
arch=('i686' 'x86_64')
url='https://www.measure-it.net'
license=('BSD')
makedepends=('git' 'qt5-base')
install=glimpse-git.install
source=('git://github.com/HSAnet/glimpse_client.git#branch=master')
sha256sums=('SKIP')

_gitname=glimpse_client

pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_gitname}"
	qmake
	make
}

package() {
	cd "${_gitname}"
	make INSTALL_ROOT="$pkgdir/" install
	install -Dm644 LICENSE.txt \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
