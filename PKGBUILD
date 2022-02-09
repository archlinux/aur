# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=python-gnarl
_pypiname=${pkgname#python-}
pkgdesc='Lightweight module to define serializable, schema-validated classes'
pkgver=0.1.0a4
pkgrel=1
arch=(any)
license=(custom:MIT)
url=https://github.com/aperezdc/gnarl
depends=(python-schema python-delorean)
makedepends=(python-hipack)
replaces=(python-lasso)
conflicts=(python-lasso)
source=("https://pypi.org/packages/source/g/${_pypiname}/${_pypiname}-${pkgver}.tar.gz" COPYING)
b2sums=('edc2630ae831b217fc8d4f282fff8bce9c8b286ee0310005ef2e9e594eaf5cf21909e38a016909d16f3d21967d3a2188ec6115dccd2f601e1d6c5c94aac6f574'
        'a3a63313e1801d623f07b36a74c200e48306c8d6c6f1b83ceb2d5bf2504e1afda996041cf51daa4b04aa5a12aeacaa18a4928d717570590f54845dceef426191')

package () {
	cd "${_pypiname}-${pkgver}"
	python setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 "${srcdir}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

check () {
	cd "${_pypiname}-${pkgver}"
	python setup.py test
}
