# Maintainer: Luís Ferreira <luis@aurorafoss.org>
# Contributor: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-catkin'
pkgname=('python-catkin' 'python2-catkin')
_module='catkin_pkg'
pkgver='0.4.12'
pkgrel=1
pkgdesc="catkin package library"
url="http://wiki.ros.org/catkin_pkg"
arch=('any')
license=('BSD')
conflicts=('python2-catkin_pkg' 'python-catkin-pkg' 'python-catkin_pkg')
makedepends=(
	'python' 'python2'
	'python-setuptools' 'python2-setuptools'
	'python-argparse' 'python2-argparse'
	'python-dateutil' 'python2-dateutil'
	'python-docutils' 'python2-docutils'
)
checkdepends=(
	'python-nose' 'python2-nose'
	'python-mock' 'python2-mock'
	'python-argparse' 'python2-argparse'
	'python-dateutil' 'python2-dateutil'
	'python-docutils' 'python2-docutils'
	'flake8' 'python2-flake8'
)
source=("https://github.com/ros-infrastructure/${_module}/archive/${pkgver}.tar.gz")
sha256sums=('cc2f4f4c02aa72d3b1fad18fe87348ac009c4b9da5602a09cd954a287d330e4e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
    python setup.py build
}

check() {
	cd "${srcdir}/${_module}-${pkgver}"
	nosetests -s --tests test
}

package_python2-catkin() {
	depends=(
		'python2'
		'python2-argparse'
		'python2-dateutil'
		'python2-docutils'
		'python2-pyparsing'
	)

    cd "${srcdir}/${_module}-${pkgver}"

    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-catkin() {
	depends=(
		'python'
		'python-argparse'
		'python-dateutil'
		'python-docutils'
		'python-pyparsing'
	)

    cd "${srcdir}/${_module}-${pkgver}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
