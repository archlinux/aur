pkgbase=('python-dxfgrabber')
pkgname=('python-dxfgrabber' 'python2-dxfgrabber')
_module='dxfgrabber'
pkgver='1.0.0'
pkgrel=2
pkgdesc="A Python library to grab information from DXF drawings - all DXF versions supported."
url="https://github.com/mozman/dxfgrabber.git"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/d0/d5/f4c1bc143223b4a2cc4e915e7e1956ef183fbe035e4a8525e336110a90ed/dxfgrabber-${pkgver}.zip")
md5sums=('d87f166fe168ef8ab58c837cedd0c370')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-dxfgrabber() {
    depends+=('python')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-dxfgrabber() {
    depends+=('python2')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
