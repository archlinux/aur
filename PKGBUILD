# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=python-aiolinkding
_name=${pkgname#python-}
pkgver=2023.11.0
pkgrel=1
pkgdesc="async library to the linkding REST API"
arch=('any')
url="https://github.com/bachya/aiolinkding"
license=('MIT')
depends=('python-aiohttp' 'python-packaging' 'python')
source=("$_name-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('0d613f2bfe03a55fbd9de59801558e15a93cf022364ff7ef6c2b04cb1c846fde662ff1505976543d5b8549a52192f49310fa7ec2b070a358eb329a8e095b1a6f')

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
