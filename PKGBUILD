# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-vispy-viewers
_pyname=glue-vispy-viewers
pkgver=1.1.0
pkgrel=1
pkgdesc="3-d data viewers for glue based on VisPy"
arch=('any')
url="http://docs.glueviz.org/en/stable/gui_guide/3d_viewers.html"
license=('BSD')
depends=('python' 'python-numpy' 'python-opengl' 'python-qtpy' 'python-scipy' 'python-glue-core>=1.13.1' 'python-glue-qt>=0.1.0' 'python-vispy')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest'
              'python-mock')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('88e16f27cc024796e1ed2828158e8c7ce4a4f4170f5a41a28d1de799a60b5d70')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"

    python setup.py install -O1 --root="${pkgdir}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

