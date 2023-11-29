# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=linkding-cli
pkgver=2023.11.0
pkgrel=1
pkgdesc="A CLI to interact with a linkding instance"
arch=('any')
url="https://github.com/bachya/linkding-cli"
license=('MIT')
depends=('python-importlib-metadata' 'python-typer' 'python-ruamel-yaml' 'python' 'python-aiolinkding')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=(104d09f2b710bb17e5983293eac1f96a33e494b360555713d08f26ec259dd98ff8530c775dfd6576a54b1962981ff03365ca9d970fb123fc1146de995be8fb24)

makedepends=(python-build python-installer python-poetry-core)

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
