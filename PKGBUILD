# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: TheJackiMonster <thejackimonster AT gmail DOT com>

_framework='gnunet'
_module='libgnunetchat'

pkgname="${_module}-git"
pkgver='r120.c6ffad6'
pkgrel=2
pkgdesc='GNUnet chat library'
arch=('i686' 'x86_64')
url="http://${_framework}.org"
license=('AGPL')
conflicts=("${_module}" "${_module}-bin")
provides=("${_module}")
depends=("${_framework}-git")
makedepends=(meson check)
options=('!makeflags' '!buildflags')
source=("git+https://git.${_framework}.org/${_module}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_module}"
	printf "'r%s.%s'" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}


prepare() {
	cd "${srcdir}/${_module}"
	meson build
}

build() {
	cd "${srcdir}/${_module}"
	meson compile -C build
}

check() {
	cd "${srcdir}/${_module}"
	meson test -C build
}

package() {
	cd "${srcdir}/${_module}"
	DESTDIR="$pkgdir" meson install -C build
}
