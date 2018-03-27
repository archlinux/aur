# Maintainer: Morten Linderud <morten@linderud.pw>  

pkgbase="python-gilt"
pkgname=("python-gilt" "python2-gilt")
_pkgname='gilt'
pkgver=1.2.1
pkgrel=2
pkgdesc='A GIT layering tool'
url='https://github.com/metacloud/gilt'
arch=('any')
license=('MIT')
makedepends=('python' 'python-setuptools' 'python-pbr'
             'python2' 'python2-setuptools' 'python2-pbr')
checkdepends=('python' 'python-click' 'python-colorama'
              'python-fasteners' 'python-yaml' 'python-sh'
              'python-giturlparse' 'python2' 'python2-click'
              'python2-colorama' 'python2-fasteners' 'python2-yaml'
              'python2-sh' 'python2-giturlparse' 'python-tox')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/metacloud/gilt/archive/${pkgver}.tar.gz")
sha256sums=('f5e37e0e50bd88579e721a992f7a24bb1a3b119f2b71d511f38cf9fb802adbbc')

prepare() {
  cp -a ${_pkgname}-$pkgver{,-py2}
}

build() {
    export PBR_VERSION="${pkgver}"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build

    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py build
}

check(){
    cd "${srcdir}/${_pkgname}-${pkgver}"
    tox -e py3

    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    tox -e py2,py3
}

package_python-gilt() {
    depends=('python' 'python-click' 'python-colorama'
             'python-fasteners' 'python-yaml' 'python-sh'
             'python-giturlparse')
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export PBR_VERSION="${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-gilt() {
    depends=('python2' 'python2-click' 'python2-colorama'
             'python2-fasteners' 'python2-yaml' 'python2-sh'
             'python2-giturlparse')
    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    export PBR_VERSION="${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    mv "${pkgdir}/usr/bin/gilt" "${pkgdir}/usr/bin/gilt2"
}
# vim:set ft=sh ts=2 sw=2 et:
