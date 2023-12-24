# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-readthedocs-sphinx-ext
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.2.5
pkgrel=1
pkgdesc="Sphinx extension for Read the Docs overrides"
arch=('any')
url="https://github.com/jayvdb/sphinx-epytext"
license=('MIT')
makedepends=('python-setuptools')
#makedepends=('python-wheel' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('822b8481398c118b9f5ab1ccabf7661d')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package() {
    depends=('python-sphinx' 'python-requests' 'python-jinja>=2.9' 'python-packaging')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
