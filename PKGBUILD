# Maintainer: KevinCrrl <kevincrrl@tuta.io>

pkgname=kpa
pkgver=3.2.0
pkgrel=1
pkgdesc="KevinCrrl Python AUR Helper: Creado para automatizar de manera segura."
arch=('any')
url="https://github.com/KevinCrrl/kpa"
license=('GPL-3.0-or-later')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=('bab117ef09ef10d1075a905929499084a0b0a43072288448278f959fa5488738e0afedbe8967a7dddda4a79c7bc0aa1d4139dcf8e5432e8885f7c629f7b2ccb5')
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

