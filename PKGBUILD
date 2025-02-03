# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=linkding-cli
pkgver=2024.09.0
pkgrel=1
pkgdesc="A CLI to interact with a linkding instance"
arch=('any')
url="https://github.com/bachya/linkding-cli"
license=('MIT')
depends=('python-importlib-metadata' 'python-typer' 'python-ruamel-yaml' 'python' 'python-aiolinkding')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=(e3e45731a4e57a58066a862d65496e86952cbec6c9399c8da3342ce4c36cc32feb5a198671763528770bf2049a6cb3981e80d5db20d500a7b558f3d572d18637)

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
