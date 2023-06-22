# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-geneabacus
pkgver=0.3.1
pkgrel=1
pkgdesc="Python IO functions for GeneAbacus"
arch=("any")
url="https://git.sr.ht/~vejnar/GeneAbacus-python"
license=("MPLv2")
depends=('python'
         'python-lz4'
         'python-numpy'
         'python-zstandard')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~vejnar/GeneAbacus-python/archive/v${pkgver}.tar.gz")
sha256sums=('5f35dc863fe3455b6f42f92155f7bab04ffdd2665939c89902a6b05adcefaee5')

build() {
    cd "$srcdir/GeneAbacus-python-v$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/GeneAbacus-python-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
