# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=virtualfish
pkgver=2.5.8
pkgrel=1
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url=https://github.com/justinmayer/virtualfish
license=("MIT")
depends=("fish" "python-packaging" "python-pkgconfig" "python-psutil" "python-virtualenv" "python-setuptools")
makedepends=("python-build" "python-wheel" "python-installer" "python-poetry-core")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ea887a44399a4b2621b71f15c1d856d54a3ff3348a3292b0dfcb2d8238fe6932')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

