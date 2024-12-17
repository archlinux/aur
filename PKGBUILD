#!/usr/bin/env bash
# Maintainer: Julian Lobbes <julian (at) lobbes (dot) dev>

_name=hyprpy
pkgname=python-hyprpy
pkgver=0.1.10
pkgrel=1
pkgdesc="Python bindings for Hyprland"
arch=('x86_64')
url="https://github.com/ulinja/${_name}"
license=('MIT')
depends=(python python-pydantic)
makedepends=(python-build python-installer)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('fede9b9637b75ad083af32c3636c27e5e954a88ee6074ac83c37c0e774440cb2beae131e3bac27313ce30e76daccbb4e1df9d2f7195bda35254d6a6f96d42ecf')

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
