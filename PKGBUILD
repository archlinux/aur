# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sphinxext-opengraph
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.4.2
pkgrel=1
pkgdesc="Sphinx extension to generate unique OpenGraph metadata"
arch=('any')
url="https://github.com/wpilibsuite/sphinxext-opengraph"
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-sphinx')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/wpilibsuite/sphinxext-opengraph/main/LICENSE.md")
md5sums=('d87194cdbc2633b61d341d4dc751413a'
         'SKIP')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
#   pytest #|| warning "Tests failed"
}

package_python-sphinxext-opengraph() {
    depends=('python-sphinx>=2.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 ${srcdir}/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-sphinxext-opengraph-doc() {
#    pkgdesc="Documentation for Sphinx OpenGraph extension"
#    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx
#
#    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
