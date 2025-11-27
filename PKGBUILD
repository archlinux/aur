# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-qt
_pyname=glue_qt
pkgver=0.4.1
pkgrel=1
pkgdesc="Multidimensional data visualization across files -- main Qt library of GUI"
arch=('any')
url="http://glueviz.org"
license=('BSD-3-Clause')
depends=('python>=3.8' 'python-glue-core>=1.15.0' 'python-numpy>=1.17' 'python-matplotlib>=3.2'
         'python-scipy>=1.1' 'python-echo>=0.6' 'python-astropy>=4.0' 'python-setuptools>=30.3.0'
         'python-qtpy>=1.9' 'ipython>=4.0' 'python-ipykernel>5.1.0' 'python-qtconsole>5.4.2'
         'python-pvextractor>=0.2' 'python-pyqt6' 'qt6-declarative' 'hicolor-icon-theme')
optdepends=('pyside2: alternative qt support'
            'glueviz-doc: Documentation for Glueviz')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'desktop-file-utils')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('9f41ec255b10517fb0cf808c40462a8993ac5890c46fe9f57d29813f2ad8091c')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm 644 glueviz.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "glueviz.desktop"
}

