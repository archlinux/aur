# Maintainer: KevinCrrl

pkgname=kpa
pkgver=2.2.1
pkgrel=1
pkgdesc="KevinCrrl Python AUR Helper"
arch=('any')
url="https://github.com/KevinCrrl/kpa"
license=('GPL3-or-later')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=("1311f539fc13ea033f107b71566c4c337b9d43021897c416cb82e52625fd11513fb1cd90063fc73049f2ad496cd14298f7341153afad95527c363fc58d394b0c")
conflicts=('kpa-bin')
depends=(
    'python'
    'python-pyxdg'
    'python-jsonschema'
    'python-colorama'
    'python-pkgbuild-parser'
    'python-requests'
    'python-typer'
    'git'
    'base-devel'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'sudo: ejecutar comandos como root'
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
