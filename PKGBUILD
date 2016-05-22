# Maintainer: wenLiangcan <boxeed at gmail dot com>

pkgbase=('pip2pkgbuild')
pkgname=('pip2pkgbuild' 'python2-pip2pkgbuild')
_module='pip2pkgbuild'
pkgver='0.2.1'
pkgrel=1
pkgdesc="Generate PKGBUILD file for a Python module from PyPi"
url="https://github.com/wenLiangcan/pip2pkgbuild"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/f5/0e/5ec2d714a0a4c2379957e8fbaae43e68ba900150094388bd677fd14c7224/pip2pkgbuild-${pkgver}.tar.gz")
md5sums=('1b6bbc13fed0c04f6ada57da097c9882')

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

