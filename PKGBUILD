# Maintainer: KevinCrrl <kevincrrl@tuta.io>

pkgname=kpa
pkgver=3.1.0
pkgrel=1
pkgdesc="KevinCrrl Python AUR Helper: Creado para automatizar de manera segura."
arch=('any')
url="https://github.com/KevinCrrl/kpa"
license=('GPL-3.0-or-later')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=('5a2cd7a4235e4a82a2abef17282c67bded0ab853d0bae1f66b8bfec4dd7e2ef52cc7dd44b0510ed676970cfb2ed3a9e5e0f34281f0c9464a440d4c8ca110be82')
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

