# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=python-aiolinkding
_name=${pkgname#python-}
pkgver=2023.10.0
pkgrel=1
pkgdesc="async library to the linkding REST API"
arch=('any')
url="https://github.com/bachya/aiolinkding"
license=('MIT')
depends=('python-aiohttp' 'python-packaging' 'python')
source=("$_name-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha512sums=(2d80653883cfd3359b428c3acd62137b3d04bae947d6beeb5bc406a11388c3510552695c37956eb0dc0b3e7629f47f4c7d0449fa6aa18a8d7271ca85bbd9289b)

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
