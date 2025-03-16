#!/usr/bin/env bash
# Maintainer: Julian Lobbes <julian (at) lobbes (dot) dev>

_name=hyprpy
pkgname=python-hyprpy
pkgver=0.2.0
pkgrel=1
pkgdesc="Python bindings for Hyprland"
arch=('x86_64')
url="https://github.com/ulinja/${_name}"
license=('MIT')
depends=(python python-pydantic)
makedepends=(python-build python-installer)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4028a5e0f1de68cd743aef07e51f61593a1fde1dd38691956f2ffef75f0c9fe2f06e903e5d800cb1ca21ab7a17b379fada41bcf7fe0cf7f350947e7a5803318f')

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
