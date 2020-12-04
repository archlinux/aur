# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgname=('python-catkin_tools')
pkgver='0.5.0'
pkgrel=1
pkgdesc='Command line tools for working with catkin'
arch=('any')
url='https://github.com/catkin/catkin_tools'
license=('Apache')
depends=('python' 'python-catkin_pkg' 'python-osrf_pycommon' 'python-yaml')
makedepends=('python-setuptools')
provides=('python-catkin-tools')
conflicts=('python2-catkin_tools' 'python-catkin-tools')
source=("https://github.com/catkin/catkin_tools/archive/${pkgver}.tar.gz"
        "fix-asyncio-py39.patch")
sha256sums=('cb7bc63c52033428e3514d9b7372f8303f7a68e56a5401b3e9eba338a7de5bb8'
            'af3f7f99eab26889b7a612d1c7634b2b8919a82e28460452808802e248533c37')

_module='catkin_tools'

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch -p1 -i "${srcdir}/fix-asyncio-py39.patch"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
