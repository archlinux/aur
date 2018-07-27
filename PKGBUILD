# Maintainer: Eric Berquist <eric dot berquist at gmail>
# Contributor: Markus Schaaf <markuschaaf@gmail.com>

_pkgname=python-xmp-toolkit
pkgname=${_pkgname}-git
pkgver=r245.5692bdf
pkgrel=1
pkgdesc='A library for working with XMP metadata'
arch=(any)
url='http://python-xmp-toolkit.readthedocs.org/'
license=(custom)
depends=('python' 'exempi')
source=('git+https://github.com/python-xmp-toolkit/python-xmp-toolkit.git')
md5sums=(SKIP)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	python setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
}
