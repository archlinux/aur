# Maintainer: J. Nathanael Philipp (jnphilipp) <jnathanael@philipp.land>

pkgname=python-bikkuri
_pkg="${pkgname#python-}"
pkgver=0.2.0
pkgrel=1
pkgdesc="Calculate the surprisal of words in texts."
url="https://github.com/jnphilipp/bikkuri"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-rust')
license=('GPL-3.0-or-later')
arch=(x86_64 aarch64)
source=("$_pkg-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("b8ed6abf24983f032477efd223d59ee8d4e07852987ff5e570868866dfc4c143c6d4ba5789799f60e662d488dd3153d769cf105f24edc3901053a9f81ffdc85b")

build() {
	cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
	cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
