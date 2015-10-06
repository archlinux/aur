# Maintainer: Lauri Niskanen <ape@ape3000.com>

pkgname=python-pyeda-git
_pkgname=pyeda
_pkgurlbase="https://github.com/cjdrake"
pkgver=v0.28.0.r9.gf4c64a3
pkgrel=1
pkgdesc="Python library for electronic design automation"
arch=('any')
url="${_pkgurlbase}/${_pkgname}"
license=('BSD')
depends=('python-setuptools')
makedepends=('git')
source=(${_pkgname}::"git+${_pkgurlbase}/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_pkgname}"

	python setup.py install --root="$pkgdir/" --optimize=1

	mkdir -pm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

