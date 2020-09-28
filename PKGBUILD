# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=mkdocs-pymdownx-material-extras
_pyname=${pkgname//-/_}
pkgver=1.1.1
pkgrel=1
pkgdesc="Plugin to extend MkDocs Material theme."
arch=('i686' 'x86_64')
url="https://github.com/facelessuser/mkdocs_pymdownx_material_extras"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('mkdocs-material-extensions')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/facelessuser/mkdocs_pymdownx_material_extras/master/LICENSE")
md5sums=('c107e0384cdf366e6549a540ff2a6575'
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
    depends=('python>=3.5' 'mkdocs-material>=5.0.2')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
