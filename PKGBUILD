# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=project-generator-definitions
pkgname=(${_pkgname} python2-${_pkgname})
pkgver=0.2.15
pkgrel=1
pkgdesc="Definitions for project-generator"
url="https://github.com/project-generator/project_generator_definitions/"
depends=('python'
         'python-setuptools'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/project-generator/${_pkgname//-/_}/archive/v${pkgver}.tar.gz")
sha512sums=('4e1dd42499e88b5a49859e7c597f695cc782b957e0c4d58ffa652e991d413ba7e9eecaa5d175a43b8a45239d6df55e65cc2b265e7bc20fe52645e31461868b2e')

prepare() {
    mv "${srcdir}/${_pkgname//-/_}-${pkgver}" "${srcdir}/${_pkgname}-${pkgver}"
    cp -a "${srcdir}/${_pkgname}-${pkgver}"{,-py2}
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build

    # Build python2 library
    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py build
}

package_project-generator-definitions() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python  setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-project-generator-definitions() {
    cd "${srcdir}/${_pkgname}-${pkgver}-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1

    # Python3 package provides files under /usr/bin
    rm -rf "${pkgdir}/usr/bin"
}
