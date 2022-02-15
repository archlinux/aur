# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_framework='anastasis'
_appname="${_framework}-gtk"
pkgname="${_appname}-git"
pkgver='r99.7fedfde'
pkgrel=1
pkgdesc='Graphical user interface for GNU Anastasis'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/${_framework}"
license=('GPL')
depends=('anastasis' 'jansson' 'gnunet' 'gnunet-gtk' 'gtk3' 'libgcrypt'
         'libmicrohttpd' 'postgresql' 'taler-exchange' 'taler-merchant')
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
