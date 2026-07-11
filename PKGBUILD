# Maintainer: KevinCrrl <kevincrrl@tuta.io>

pkgname=kpa
pkgver=3.1.1
pkgrel=1
pkgdesc="KevinCrrl Python AUR Helper: Creado para automatizar de manera segura."
arch=('any')
url="https://github.com/KevinCrrl/kpa"
license=('GPL-3.0-or-later')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=('c32e66053a66e1af9dfbf2a51f5751f225930e39102bf4ddf6568c389fed1118fbcd5c946721f07cc4311511c8f7d19ac776402c3c72c65418ebb164d8e4193b')
depends=(
    'python'
    'python-pyxdg'
    'python-jsonschema'
    'python-pkgbuild-parser'
    'python-requests'
    'python-typer'
    'python-rich'
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
    install -Dm755 mkpa.sh $pkgdir/usr/bin/mkpa
}

