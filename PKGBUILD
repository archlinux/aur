# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-tcm
_pkg="${pkgname#python-}"
pkgver=0.1.3
pkgrel=1
pkgdesc="Topic Context Model (TCM)."
url="https://github.com/jnphilipp/tcm"
depends=('python-scipy' 'python-scikit-learn' 'python-conllu')
makedepends=('python-setuptools')
license=('GPL-3.0-or-later')
arch=(any)
source=("$_pkg-$pkgver.tar.gz::https://github.com/jnphilipp/tcm/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("fa4ae6bff4c7b8d26c4b10ee612653fd56fc8b5e876831e846bd0e83cbb6f2f4")

build() {
	cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
	cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
