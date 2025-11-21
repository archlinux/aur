# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-vispy-viewers
_pyname=glue_vispy_viewers
pkgver=1.3.0
pkgrel=1
pkgdesc="3-d data viewers for glue based on VisPy"
arch=('any')
url="http://docs.glueviz.org/en/stable/gui_guide/3d_viewers.html"
license=('BSD-2-Clause')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest-xvfb'
              'xorg-server-xvfb'
              'python-glue-core'
              'python-opengl'
              'python-vispy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('4d3fe2a605c567977e546a9367f1f0eddc1cc0b2b3234e71aec66ec3669ed45e')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest -vv -l -ra --color=yes -o console_output_style=count #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count # no need -p xvfb
}

package() {
    depends=('python>=3.8' 'python-matplotlib' 'python-opengl' 'python-scipy' 'python-glue-core>=1.17.0' 'python-vispy>=0.12.0' 'python-glfw' 'python-imageio')
    optdepends=('python-qtpy: pyqt, pyside'
                'python-glue-qt>=0.4.0: pyqt, pyside'
                'python-pyqt6: pyqt'
                'pyside6: pyside')
    cd "${srcdir}/${_pyname}-${pkgver}"

    python setup.py install -O1 --root="${pkgdir}"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

