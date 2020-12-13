# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgbase=python-pidfile
pkgname=(python-pidfile python2-pidfile)
pkgver=3.0.0
pkgrel=2
_name=${pkgname#python-}
pkgdesc="Python context manager for managing pid files"
arch=("any")
url="https://pypi.python.org/pypi/python-pidfile"
license=('MIT')
makedepends=("python-setuptools" "python2-setuptools")

source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/p/python-pidfile/python-pidfile-${pkgver}.tar.gz")
sha512sums=("82f87a2b3ac733ced78a87216f42b7fdc91f956fa9ec7e64f67ea5d53caf38652dc8b6e0518f6cfacf6bfe662c5d732f632b8f469af60555a8e6a43dbb99afbe")

prepare() {
    cp -a ${pkgbase}-${pkgver} python2-${_name}-${pkgver}
}

build() {
    cd "${srcdir}/python-${_name}-${pkgver}"
    python setup.py build

    cd "${srcdir}/python2-${_name}-${pkgver}"
    python2 setup.py build
}

package_python-pidfile() {
    depends=("python" "python-psutil")

    export PYTHONHASHSEED=0
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -D -m755 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

package_python2-pidfile() {
    depends=("python2" "python2-psutil")

    export PYTHONHASHSEED=0
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -D -m755 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
