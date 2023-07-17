# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-macs3
pkgver=3.0.0b2
pkgrel=1
pkgdesc="MACS -- Model-based Analysis of ChIP-Seq"
arch=("x86_64")
url="https://macs3-project.github.io/MACS"
license=("BSD")
depends=('python'
         'python-hmmlearn'
         'python-numpy')
makedepends=('cython'
             'python-cykhash'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("https://pypi.python.org/packages/source/m/macs3/MACS3-${pkgver}.tar.gz")
sha256sums=('9b13fed49b93623ddde4b2d5106fc92a796111fa92148cafe7d8bd9a2e8aa43f')

build() {
    cd "$srcdir/MACS3-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/MACS3-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
