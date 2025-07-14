# Maintainer: Filip Andersson <filip@artifact.se>
#
# NOTE: This package requires additional Python dependencies that are not available
# in the official Arch repositories. After installing this package, you must manually
# install the required dependencies using pip:
#
#   pip install py2neo
#
# Other dependencies may also be required. If you encounter import errors, install
# the missing packages with pip.


_name=mal-gui
pkgname='python-mal-gui'
pkgver=0.0.8
pkgrel=1
pkgdesc="A graphical user interface tool used to create MAL instance models."
arch=('any')
url=https://github.com/mal-lang/"${_name}"
license=('Apache-2.0')
depends=(
    'python>=3.10'
    'python-mal-toolbox'
    'python-numpy'
    'pyside6'
    'pyside6-tools'
    'shiboken6'
    'python-qt-material'
    'qt6-tools'
    'python-appdirs'
    'python-networkx'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
optdepends=(
  'NOTE: Install manually with pip: py2neo (required for Neo4j integration)'
)
source=("${_name}-${pkgver}.tar.gz::https://github.com/mal-lang/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e00bd0295aced1467e8c3685a8c892b177d0f0f2ce0d25b84f54451fbf54bc98')


prepare() {
    cd "${srcdir}/${_name}-${pkgver}"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license if it exists
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    elif [ -f COPYING ]; then
        install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    fi
    
    # Install documentation
    if [ -f README.md ]; then
        install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    fi
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
}
