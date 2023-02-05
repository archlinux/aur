# Maintainer: ghesy <ehsan at disroot dot org>
# Contributor: Angel Dimov <cyfraka at protonmail dot com>

_pkgname='curseradio'
pkgname="${_pkgname}-git"
pkgver=r15.1bd4bd0
pkgrel=1
epoch=1
pkgdesc='Command line radio player'
url='https://github.com/chronitis/curseradio'
source=("git+${url}.git")
md5sums=('SKIP')
arch=('any')
license=('MIT')
makedepends=('git' 'python-setuptools')
depends=('python' 'python-requests' 'python-xdg' 'python-lxml' 'mpv')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${_pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/curseradio/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	python setup.py install --root="$pkgdir" --optimize=1
}
