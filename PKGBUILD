# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=virtualfish
pkgver=2.5.7
pkgrel=3
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url=https://github.com/justinmayer/virtualfish
license=("custom:MIT")
depends=("fish" "python-packaging" "python-pkgconfig" "python-psutil" "python-virtualenv")
makedepends=("python-poetry-core" "python-installer")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f507d8cd281cb1c1ebf6021fc18ac20a85d8afbfc5ea4fe8eb0a3f54349bc9ba')

check() {
    cd "$srcdir/$pkgname-$pkgver"

    poetry check
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    poetry build --format wheel --output dist
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

