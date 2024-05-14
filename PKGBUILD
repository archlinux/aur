# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=virtualfish
pkgver=2.5.9
pkgrel=1
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url=https://github.com/justinmayer/virtualfish
license=("MIT")
depends=("fish" "python-packaging" "python-pkgconfig" "python-psutil" "python-virtualenv" "python-setuptools")
makedepends=("python-build" "python-wheel" "python-installer" "python-poetry-core")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9beada15b00c5b38c700ed8dfd76fe35ad0c716dec391536cc322ddd1bccf5e2')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

