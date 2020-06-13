# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: sekret

_pkgname=2048.c
pkgname=${_pkgname}-git
pkgver=20191210.9b387c3
pkgrel=1
pkgdesc='Console version of the game "2048" for GNU/Linux'
url='https://github.com/mevdschee/2048.c'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
license=('custom:MIT')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/mevdschee/2048.c.git")
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

check() {
	cd "${srcdir}/${_pkgname}"
	./2048 test
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 2048 "${pkgdir}/usr/bin/2048"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
