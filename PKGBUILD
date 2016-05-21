# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgbase=('pip2pkgbuild')
pkgname=('pip2pkgbuild' 'python2-pip2pkgbuild')
_module='pip2pkgbuild'
pkgver='0.2.0'
pkgrel=1
pkgdesc="Generate PKGBUILD file for a Python module from PyPi"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/6b/1a/0b58dacf28f7de415f763e29d33167a9770a09d114da8768b204711f1a73/pip2pkgbuild-${pkgver}.tar.gz")
md5sums=('5d678ca36b5f4cae37dfb2a5681a87b0')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_pip2pkgbuild() {
    depends+=('python' 'python-pip')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-pip2pkgbuild() {
    depends+=('python2' 'python2-pip')
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    mv "${pkgdir}/usr/bin/pip2pkgbuild"{,2}
}

