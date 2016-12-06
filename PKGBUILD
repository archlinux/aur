# Maintainer: Bryce Guinta <bryce.paul.guinta@gmail.com>
pkgbase=('python-webkit-server')
pkgname=('python-webkit-server' 'python2-webkit-server')
_module='webkit-server'
pkgver='1.0'
pkgrel=1
pkgdesc="a Webkit-based, headless web client"
url="https://github.com/niklasb/webkit-server"
depends=('qt5-base' 'qt5-webkit')
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/$(echo ${_module:0:1} | tr '[:upper:]' '[:lower:]')/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('8463245c2b4f0264d934c0ae20bd4654')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
    # For some reason webkit_server.py is not being copied over
    cp webkit_server.py  build/lib

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
    cp webkit_server.py  build/lib
}

package_python-webkit-server() {
    depends+=('python')
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-webkit-server/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-webkit-server() {
    depends+=('python2')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python2-webkit-server/LICENSE"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
