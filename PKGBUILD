# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=project-generator-definitions
pkgname=(${_pkgname} python2-${_pkgname})
pkgver=0.2.38
pkgrel=1
pkgdesc="Definitions for project-generator"
url="https://github.com/project-generator/project_generator_definitions/"
depends=('python'
         'python-setuptools'
         'python2-setuptools'
         'python2-pip'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/project-generator/${_pkgname//-/_}/archive/v${pkgver}.tar.gz")
sha512sums=('74f0d564282e9bdac6ebbd824aaae75c40e7aeab2ff38ef4adfd1e3da81c8a1c19fd78e9998130eb99e26bbae36e55c621135875fae23c957221ca9c683655c4')

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
