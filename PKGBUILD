# Contributor: Vojtech Kral <vojtech_kral^hk>

pkgbase=python-flask-pymongo
pkgname=('python-flask-pymongo' 'python2-flask-pymongo')
_realname=Flask-PyMongo
pkgver=0.4.0
pkgrel=1
pkgdesc='Flask-PyMongo bridges Flask and PyMongo, so that you can use Flask’s normal mechanisms to configure and connect to MongoDB.'
_baseurl='https://pypi.python.org'
url="https://flask-pymongo.readthedocs.org/en/latest/"
arch=('any')
license=('BSD')
makedepends=('python-distribute' 'python2-distribute')
source=("${_baseurl}/packages/source/F/${_realname}/${_realname}-${pkgver}.tar.gz"
				'LICENSE')
sha256sums=('707ddff92f5b7bdc34d401f1f3857a3d1a9f5dba76e6a1422ccbc3651e2ca521'
            'afa271f992bd7a47170804144a9b1f923a18ea91592c2945c4e9e4b9d025fe54')

prepare() {
	# We ship separated python{,2}-packaging packages.
	cp -a ${_realname}-${pkgver}{,-python2}
}

build() {
	# Build python 3 module
	cd "${srcdir}/${_realname}-${pkgver}"
	python3 setup.py build

	# Build python 2 module
	cd "${srcdir}/${_realname}-${pkgver}-python2"
	python2 setup.py build
}

package_python-flask-pymongo() {
	depends=('python-flask>=0.8' 'python-pymongo>=2.4')

	cd "${srcdir}/${_realname}-${pkgver}"
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

	_licenses_path="${pkgdir}/usr/share/licenses/python-flask-pymongo"
	install -D -m644 ${srcdir}/LICENSE "${_licenses_path}/LICENSE"
}

package_python2-flask-pymongo() {
	depends=('python2-flask>=0.8' 'python2-pymongo>=2.4')

	cd "${srcdir}/${_realname}-${pkgver}-python2"
	python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

	_licenses_path="${pkgdir}/usr/share/licenses/python2-flask-pymongo"
	install -D -m644 ${srcdir}/LICENSE "${_licenses_path}/LICENSE"
}

