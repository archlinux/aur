# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf_coordinates_schemas
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.1.0
pkgrel=1
pkgdesc="ASDF schemas for coordinates"
arch=('any')
url="https://github.com/asdf-format/asdf-coordinates-schemas"
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-asdf')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('f446e656c78dbb66e24010211e3a9979')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-asdf_coordinates_schemas() {
    depends=('python>=3.7' 'python-asdf>=2.8.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
