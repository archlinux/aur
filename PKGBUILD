# Maintainer: Filip Andersson <filip@artifact.se>
#
# NOTE: Additional dependencies may also be required. If you encounter import errors, install
# the missing packages with pip.


_name=mal-toolbox
pkgname='python-mal-toolbox'
pkgver=1.0.0
pkgrel=1
pkgdesc="A collection of tools used to create MAL models and attack graphs."
arch=('any')
url=https://github.com/mal-lang/"${_name}"
license=('Apache-2.0')
depends=(
    'python>=3.10'
    'python-antlr4'
    'python-docopt'
    'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'git')
source=("${_name}-${pkgver}.tar.gz::https://github.com/mal-lang/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('863bad28b6b8e37304230f11d06a6cdbda6329215026332606d1b2e4330ad3e4')


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
