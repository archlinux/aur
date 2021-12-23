# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf_transform_schemas
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.2.0
pkgrel=1
pkgdesc="ASDF schemas for transforms"
arch=('any')
url="https://github.com/asdf-format/asdf-transform-schemas"
license=('BSD')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest' 'python-asdf')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a0af2f29a54c0c0d9a0387c1c22c5462')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-asdf_transform_schemas() {
    depends=('python>=3.7' 'python-asdf>=2.8.0' 'python-importlib_resources>=3')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
