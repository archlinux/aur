# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=macs3
pkgver=3.0.3
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
source=("https://pypi.python.org/packages/source/m/macs3/macs3-${pkgver}.tar.gz")
sha256sums=('ee1c892901c4010ff9e201b433c0623cbd747a3058300322386a7185623b1684')

build() {
    cd "$srcdir/macs3-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/macs3-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
