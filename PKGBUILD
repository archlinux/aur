#!/usr/bin/env bash
# Maintainer: Julian Lobbes <julian (at) lobbes (dot) dev>

_name=hyprpy
pkgname=python-hyprpy
pkgver=0.2.1
pkgrel=1
pkgdesc="Python bindings for Hyprland"
arch=('x86_64')
url="https://github.com/ulinja/${_name}"
license=('MIT')
depends=(python python-pydantic)
makedepends=(python-build python-installer)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('27d17c4456195ecb790e8d326dfda83fbba2953ff864f4e1b0781232a7c4b16b4c0afbc516283c4e41031b926ad764c39cca3a4a257187b33acf2fa0ccc7eb59')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel
}

check() {
    cd "${_name}-${pkgver}"
    python -c "import hyprpy"
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
