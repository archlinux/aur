# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=mkdocs-pymdownx-material-extras
_pyname=${pkgname//-/_}
pkgver=1.1.3
pkgrel=1
pkgdesc="Plugin to extend MkDocs Material theme."
arch=('i686' 'x86_64')
url="https://github.com/facelessuser/mkdocs_pymdownx_material_extras"
license=('MIT')
makedepends=('python-setuptools' 'mkdocs-material>=5.0.2')
checkdepends=('python-mkdocs-material-extensions')
provides=('python-mkdocs-material-pymdownx-extra')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/facelessuser/mkdocs_pymdownx_material_extras/master/LICENSE")
md5sums=('e3393bf20e772f7c91c81a262e44e507'
         'SKIP')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test || warning "Tests failed"
}

package() {
    depends=('python>=3.6' 'mkdocs-material>=5.0.2')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
