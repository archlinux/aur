# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-tcm
_pkg="${pkgname#python-}"
pkgver=0.1.5
pkgrel=2
pkgdesc="Topic Context Model (TCM)."
url="https://github.com/jnphilipp/tcm"
depends=('python-scipy' 'python-scikit-learn' 'python-conllu')
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('GPL-3.0-or-later')
arch=(any)
source=("$_pkg-$pkgver.tar.gz::https://github.com/jnphilipp/tcm/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("1752edbfab70f9d707c5cee5294133c5bef1f2c5342dd9797e5cec29a1c53776")

build() {
	cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
	cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
