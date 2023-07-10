# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-vispy-viewers
_pyname=glue-vispy-viewers
pkgver=1.0.7
pkgrel=1
pkgdesc="3-d data viewers for glue based on VisPy"
arch=('any')
url="http://docs.glueviz.org/en/stable/gui_guide/3d_viewers.html"
license=('BSD')
depends=('python' 'python-numpy' 'python-opengl' 'python-qtpy' 'python-scipy' 'python-astropy' 'python-glue-core' 'python-vispy')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest'
              'python-mock')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('1d2192adaf60556938f0e392f61dc103fb1fa50a8b1ec45169ca77c2543c0652')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv --color=yes
}

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"

    python setup.py install -O1 --root="${pkgdir}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

