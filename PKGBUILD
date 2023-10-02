# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=linkding-cli
_name=${pkgname//-/_}
pkgver=2023.10.0
pkgrel=1
pkgdesc="A CLI to interact with a linkding instance"
arch=('any')
url="https://github.com/bachya/linkding-cli"
license=('MIT')
depends=('python-importlib-metadata' 'python-typer' 'python-ruamel-yaml' 'python' 'python-aiolinkding')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=(0f5385939fdf97d66abf77a7f08c8befe4c80450d04bb6c3faa48bba9fa0713bb8f6d441b1afa83dff2911e0250b92747a80818d48d407344aedcdcb5852b3d5)

makedepends=(python-build python-installer python-poetry-core)

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
