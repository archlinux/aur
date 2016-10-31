# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=project-generator-definitions
pkgname=(${_pkgname} python2-${_pkgname})
pkgver=0.2.31
pkgrel=1
pkgdesc="Definitions for project-generator"
url="https://github.com/project-generator/project_generator_definitions/"
depends=('python'
         'python-setuptools'
         'python2-setuptools'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/project-generator/${_pkgname//-/_}/archive/v${pkgver}.tar.gz")
sha512sums=('be3c487391660a7e6dfa7b9a1e2798fa76a61bcc24b6843754738f4cd9663946788f798aab7a0910b990dfde1b2fccd16273299e6db183b1ca1b0b740881b694')

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
