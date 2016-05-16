# Maintainer: ptrr <piksarv .at. gmail.com>
pkgname=('python-ml_metrics' 'python2-ml_metrics')
_pkgname='Metrics'
pkgver=2015.09.08.g9a637ae
pkgrel=1
pkgdesc="Python implementation of Metrics implementations a library of various supervised machine learning evaluation metrics"
arch=(any)
url="https://github.com/benhamner/Metrics"
license=('BSD')
makedepends=('git')
source=("git+https://github.com/benhamner/Metrics.git")
md5sums=('SKIP')

prepare() {
        cp -a ${_pkgname}{,-py2}
}

pkgver() {
        cd "${srcdir}/${_pkgname}"
        git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

package_python-ml_metrics() {
	depends=('python' 'python-numpy' 'python-pandas')
	provides=('python-ml_metrics')

	cd "${srcdir}/${_pkgname}/Python"
	python ./setup.py install --root="${pkgdir}" --prefix=/usr
	
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
            "${pkgdir}/usr/share/licenses/python-ml_metrics/LICENSE"
}

package_python2-ml_metrics() {
	depends=('python2' 'python2-numpy' 'python2-pandas')
	provides=('python2-ml_metrics')

	cd "${srcdir}/${_pkgname}-py2/Python"
	python2 ./setup.py install --root="${pkgdir}" --prefix=/usr
	
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
            "${pkgdir}/usr/share/licenses/python2-ml_metrics/LICENSE"
}
