# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Maarten van Gompel <proycon at anaproy dot nl>

pkgbase=python-smart_open
pkgname=('python-smart_open' 'python2-smart_open')
_pkgname=smart_open
pkgver=1.6.0
pkgrel=1
pkgdesc="Library for efficient streaming of very large files from/to S3, HDFS, WebHDFS, HTTP, or local (compressed) files"
arch=('any')
license=('MIT')
url="https://github.com/RaRe-Technologies/smart_open"
makedepends=('python-setuptools' 'python-requests' 'python-boto' 'python-boto3')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/RaRe-Technologies/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('11500a874b17fe7b0f720d6e29647403f9075395ad347c8f608d536105e2398c5747162c9733964ee39225b8073389582e162dfd6008115a8395b13357351e99')

prepare() {
	cp -a "${srcdir}/${_pkgname}-${pkgver}"{,-py2}
}

build_python-smart_open() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

build_python2-smart_open() {
	cd "${srcdir}/${_pkgname}-${pkgver}-py2"
	python2 setup.py clean
	rm -rf build dist
	python2 setup.py build
}

package_python-smart_open() {
	depends=('python-requests' 'python-boto' 'python-boto3')
	optdepends=("python-bz2file: Handling bz2 files")

	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-smart_open() {
	depends=('python2-requests' 'python2-boto' 'python2-boto3')
	optdepends=("python2-bz2file: Handling bz2 files")


	cd "${srcdir}/${_pkgname}-${pkgver}-py2"
	python2 setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
