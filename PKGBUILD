# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=linkding-cli
_name=${pkgname//-/_}
pkgver=2023.8.0
pkgrel=1
pkgdesc="A CLI to interact with a linkding instance"
arch=('any')
url="https://github.com/bachya/linkding-cli"
license=('MIT')
depends=('python-importlib-metadata' 'python-typer' 'python-ruamel-yaml' 'python' 'python-aiolinkding')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=(e44795d6dc522071ed7adf216ced19b73588c40fdf106ae39d1968d10f5ac1c583dc84410dcb093c47cc50567d78574266502d40518cdeac486f842f4478ff19)

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
