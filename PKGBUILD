# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-geneabacus
pkgver=0.3.2
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
sha256sums=('ae15b2f4be443ffc06122879d955a17bb7f21afb11f1dc491d36fc403c58734c')

build() {
    cd "$srcdir/GeneAbacus-python-v$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/GeneAbacus-python-v$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
