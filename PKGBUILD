# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=python-aiolinkding
_name=${pkgname#python-}
pkgver=2023.8.0
pkgrel=1
pkgdesc="async library to the linkding REST API"
arch=('any')
url="https://github.com/bachya/aiolinkding"
license=('MIT')
depends=('python-aiohttp' 'python-packaging' 'python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=(d8f240010aa6f7cc4ab813396f3d0f898330fb481ccd628066e0a3cf5bf6550c9f5550ec0f63220a311dd87f3dce9a6c1de40bd54f11f42f3ebfee4b17106e4d)

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
