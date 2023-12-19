# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=python-aiolinkding
_name=${pkgname#python-}
pkgver=2023.12.0
pkgrel=1
pkgdesc="async library to the linkding REST API"
arch=('any')
url="https://github.com/bachya/aiolinkding"
license=('MIT')
depends=('python-aiohttp' 'python-packaging' 'python')
source=("$_name-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")
sha512sums=(0b4e157ea00b86a5e28f3a0df675091e5d9c45c6e97e058f08bc50490954eaa2dd2622cda2c75f7fdd70f0ac357b6be8caca823ec954203bc89f6e62697599c7)

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
