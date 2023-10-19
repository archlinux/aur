# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-macs3
pkgver=3.0.0b3
pkgrel=1
pkgdesc="MACS -- Model-based Analysis of ChIP-Seq"
arch=("x86_64")
url="https://macs3-project.github.io/MACS"
license=("BSD")
depends=('python'
         'python-hmmlearn'
         'python-numpy')
makedepends=('cython0' # MACS3 isn't yet compatible with Cython3
             'python-cykhash'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("https://pypi.python.org/packages/source/m/macs3/MACS3-${pkgver}.tar.gz"
        "no_pip.patch")
sha256sums=('caa794d4cfcd7368447eae15878505315dac44c21546e8fecebb3561e9cee362'
            'a07b4d9fa3f0e11a97c7ffae59cc6265335d6029858609ef08e8b1de88ab71ed')

prepare() {
    cd "$srcdir/MACS3-$pkgver"
    # Skip pip
    patch -p1 -i "${srcdir}/no_pip.patch"
}

build() {
    cd "$srcdir/MACS3-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/MACS3-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
