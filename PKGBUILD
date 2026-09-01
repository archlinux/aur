# Maintainer: KevinCrrl <kevincrrl@tuta.io>

pkgname=kpa
pkgver=3.2.2
pkgrel=1
pkgdesc="KevinCrrl Python AUR Helper: Creado para automatizar de manera segura."
arch=('any')
url="https://github.com/KevinCrrl/kpa"
license=('GPL-3.0-or-later')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=('0c81777bb70c9b50960a36283528d3ca09c646a710926736a6e32388cba0be68bc0346853e9b186c9a471a7c9b6e8d11fd61d435ffb4ecd90ebfc2c635e43e02')
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

