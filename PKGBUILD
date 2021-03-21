# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-readthedocs-sphinx-ext
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=2.1.4
pkgrel=1
pkgdesc="Sphinx epytext extension"
arch=('i686' 'x86_64')
url="https://github.com/jayvdb/sphinx-epytext"
license=('MIT')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('c97f54091d5d841f19187a0a91475565')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest
}

package() {
    depends=('python-sphinx' 'python-requests' 'python-jinja>=2.9')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
