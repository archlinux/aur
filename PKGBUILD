# Maintainer: Batuhan Baserdem
# vim:ft=PKGBUILD
_name='matlab_kernel'
pkgname="jupyter-${_name}"
pkgver='0.17.1'
pkgrel=1
pkgdesc='A Jupyter kernel for Matlab'
arch=('any')
url="https://github.com/Calysto/${_name}"
license=(custom)
makedepends=('python-wurlitzer')
depends=(
    'jupyter-metakernel'
    'python-jupyter_client'
    'ipython'
)
optdepends=(
    'matlab: Runtime dependency on MATLAB'
    'python-matlabengine: Runtime dependency on python API for MATLAB'
)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e40cfe65eb5e09cb6393a309400107c10ede3ae76fff02db737d52631a2938db')
build() {
    # Build files
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    # Install files
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    # Install license
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
