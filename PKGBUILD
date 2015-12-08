# Maintainer: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='python2-lasso'
_pkgname='python-lasso'
_pypiname=${_pkgname#python-}
pkgdesc='Lightweight module to define serializable, schema-validated classes'
pkgver='0.0.3'
pkgrel=1
arch=('any')
license=('custom:MIT')
url="https://github.com/aperezdc/${_pkgname}"
depends=('python2-schema' 'python2-delorean')
source=("https://pypi.python.org/packages/source/l/${_pypiname}/${_pypiname}-${pkgver}.tar.gz"
	COPYING)
md5sums=('950682bfc3adf20c96c3268f43c7d955'
         '0e0f33b93b6e3cbb30bfde284d35a516')
sha512sums=('249c5f79c8e2f23804ea93ba9324b8e6c1a2020242db6b0d9c3f1125718ad3e9a479b32351cce52c90316ea27bd4e0f68b8dc2419423292241058f93e7ab1b90'
            'aa09f964180fbd1db3337ba82af84787ff57ab57d17e665dfab69f70834600f5ae18bce92e7c65036fc7d13015dd3107528cacf08886ee9a3e3bf3916e8e2efe')

package () {
	cd "${_pypiname}-${pkgver}"
	sed '/usr\/bin\/env/s/python3/python2/' -i lasso.py
        sed '/usr\/bin\/env/s/python/python2/' -i setup.py
	python2 setup.py install --optimize=1 --root="${pkgdir}"
	install -Dm644 "${srcdir}/COPYING" \
		"${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
