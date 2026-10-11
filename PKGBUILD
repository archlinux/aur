# Maintainer: Radu Potop <radu@wooptoo.com>

upstream_name=dr14_t.meter
pkgname=python-dr14_tmeter
pkgver=2.1.0
pkgrel=1
pkgdesc="Compute the DR14 of a given audio file"
arch=(any)
url="https://github.com/simon-r/$upstream_name"
license=("GPL-3.0-only")
depends=("python")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
conflicts=("dr14_tmeter")
provides=("dr14_tmeter")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "$upstream_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$upstream_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/man/man1/"  man/dr14_tmeter.1
    install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

sha256sums=('8f85f4e4a5c3318cf428f6eaba03b62a63281fe41492ed1e2bb2531f711897a5')
