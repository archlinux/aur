# Maintainer: Andrey Anshin <Andrey.Anshin@taragol.is>

pkgname=python-pidfile
pkgver=3.0.0
pkgrel=3
pkgdesc="Python context manager for managing pid files"
arch=("any")
url="https://pypi.python.org/pypi/python-pidfile"
license=('MIT')
makedepends=("python-setuptools")
depends=("python" "python-psutil")

source=("${pkgname}-${pkgver}.tar.gz::https://pypi.io/packages/source/p/python-pidfile/${pkgname}-${pkgver}.tar.gz")
sha512sums=("82f87a2b3ac733ced78a87216f42b7fdc91f956fa9ec7e64f67ea5d53caf38652dc8b6e0518f6cfacf6bfe662c5d732f632b8f469af60555a8e6a43dbb99afbe")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python" "python-psutil")

    export PYTHONHASHSEED=0
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -D -m755 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
