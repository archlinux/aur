# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=macs3
pkgver=3.0.1
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
source=("https://pypi.python.org/packages/source/m/macs3/MACS3-${pkgver}.tar.gz")
sha256sums=('b07ca6e84a71aab29589f63e3dff96049aa6739e055a629125b31c788c877016')

build() {
    cd "$srcdir/MACS3-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/MACS3-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
