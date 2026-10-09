# Maintainer: J. Nathanael Philipp (jnphilipp) <jnathanael@philipp.land>

pkgname=python-bikkuri
_pkg="${pkgname#python-}"
pkgver=0.3.0
pkgrel=1
pkgdesc="Calculate the surprisal of words in texts."
url="https://github.com/jnphilipp/bikkuri"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-rust')
license=('GPL-3.0-or-later')
arch=(x86_64 aarch64)
source=("$_pkg-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("9e1398ff3224438baa83267f721f8072a81061d627d71f16d2b60db8f1354dac6c2d689cb0545ec9dd0c16eeae68b1cf9894e6b693c49877cde0669fc8d706c4")

build() {
	cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

check() {
	cd "${_pkg}-$pkgver"
	make test
}

package() {
	cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
