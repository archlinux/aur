# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
pkgname=python-keras-flops
_name=${pkgname#python-}
pkgver=0.1.2
pkgrel=2
pkgdesc="FLOPs calculator for TF2+"
arch=('any')
url="https://github.com/tokusumi/keras-flops"
license=('MIT')
depends=('python-tensorflow' 'python-numpy')
makedepends=('python-installer' 'python-poetry')
options=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2561043d435dce3b0b6a68573a538facddbcfa637faf7ae7f48b2e8f373ed84e')

build() {
	cd "$srcdir/${_name}-${pkgver}"
    poetry build --no-interaction --format wheel
}

package() {
	cd "$srcdir/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/python-keras-flops/LICENSE"
}
