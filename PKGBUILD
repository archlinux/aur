# Maintainer: Bryce Guinta <bryce.paul.guinta@gmail.com>
pkgbase=('python-dryscrape')
pkgname=('python-dryscrape' 'python2-dryscrape')
_module='dryscrape'
pkgver='1.0'
pkgrel=2
pkgdesc="a lightweight Javascript-aware, headless web scraping library for Python"
url="https://github.com/niklasb/dryscrape"
# Unfortunately changing depends inside the package() function
# Will not resolve for packages Inside the aur(for yaourt),
# therefore I will need to depend on both versions of the packages.
depends=('python-xvfbwrapper' 'python-lxml' 'python-webkit-server' 'python2-xvfbwrapper' 'python2-lxml' 'python2-webkit-server')
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/$(echo ${_module:0:1} | tr '[:upper:]' '[:lower:]')/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('267e380a8efaf9cd8fd94de1639d3198')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-dryscrape() {
    depends+=('python')
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python-dryscrape/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-dryscrape() {
    depends+=('python2')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/python2-dryscrape/LICENSE"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
