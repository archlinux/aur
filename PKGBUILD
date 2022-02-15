# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_appname='anastasis'
pkgname="${_appname}-git"
pkgver='r240.294f347'
pkgrel=1
pkgdesc='Protocol and implementation to securely deposit core secrets and recover them if their original copies are lost'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/${_appname}"
license=('AGPL')
depends=('jansson' 'gnunet' 'libgcrypt' 'postgresql' 'taler-exchange'
         'taler-merchant')
conflicts=("${_appname}" "${_appname}-bin")
provides=("${_appname}")
source=("git+https://git.taler.net/${_appname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_appname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_appname}"
	./bootstrap
}

build() {
	cd "${srcdir}/${_appname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_appname}"
	make DESTDIR="${pkgdir}" install
}

