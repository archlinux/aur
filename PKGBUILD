# Maintainer: grufo <madmurphy333 AT gmail DOT com>

_projname='NExtGen'
_appname="${_projname,,}"
pkgname="${_appname}-git"
pkgver='r8.f53eefd'
pkgrel=1
pkgdesc="A small bash script that lets you easily set up a new extension project for GNOME's Nautilus file manager"
arch=('any')
url="https://github.com/madmurphy/${_projname}"
license=('GPL')
depends=('bash' 'libnautilus-extension')
provides=("${_appname}")
conflicts=("${_appname}")
source=("git+https://github.com/madmurphy/${_projname}.git")
sha256sums=('SKIP')

pkgver() {

	cd "${_projname}"
	printf "'r%s.%s'" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {

	cd "${srcdir}/${_projname}"
	autoreconf -i

}

build() {

	cd "${srcdir}/${_projname}"
	./configure --prefix=/usr

}

package() {

	cd "${srcdir}/${_projname}"
	make DESTDIR="${pkgdir}" install

}

