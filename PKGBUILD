# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgbase=python-pykickstart
pkgname=(python-pykickstart python2-pykickstart pykickstart-tools)
pkgver=3.3
_tag=r${pkgver}-1
pkgrel=1
pkgdesc='a python library that is used for reading and writing kickstart files'
arch=(any)
license=(GPL)
url='http://fedoraproject.org/wiki/Pykickstart'
makedepends=(python python2 urlgrabber)
source=("pykickstart-${pkgver}.tar.gz::https://github.com/rhinstaller/pykickstart/archive/${_tag}.tar.gz")
sha256sums=('054a506dd26e3573717effcd4f5b1d4d74e59ce666c57844559ecaa3ca32329c')

package_python-pykickstart() {
	pkgdesc='a python library that is used for reading and writing kickstart files - python 3.x pkg'
	depends=('python' 'python-requests' 'urlgrabber')

	cd pykickstart-${_tag}

	python3 setup.py install --root="${pkgdir}" --optimize=1

	# this is distributed with tools package
	rm -rf "${pkgdir}"/usr/{bin,share}
}

package_python2-pykickstart() {
	pkgdesc='a python library that is used for reading and writing kickstart files - python 2.x pkg'
	depends=('python2' 'python2-requests' 'urlgrabber')

	cd pykickstart-${_tag}

	python2 setup.py install --root="${pkgdir}" --optimize=1

	# this is distributed with tools package
	rm -rf "${pkgdir}"/usr/{bin,share}
}

package_pykickstart-tools() {
	pkgdesc='tools for reading and writing kickstart files'
	depends=('python-pykickstart')

	cd pykickstart-${_tag}

	python setup.py install --root="${pkgdir}" --optimize=1

	# this is distributed with libs package
	rm -rf "${pkgdir}"/usr/lib
}

