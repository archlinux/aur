#!/usr/bin/env bash
# Maintainer: Julian Lobbes <julian (at) lobbes (dot) dev>

_name=hyprpy
pkgname=python-hyprpy
pkgver=0.1.9
pkgrel=1
pkgdesc="Python bindings for Hyprland"
arch=('x86_64')
url="https://github.com/ulinja/${_name}"
license=('MIT')
depends=(python python-pydantic)
makedepends=(python-build python-installer)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2beb6d105b3a6c3aced0d0ab539a507e885cdd979689a12f6840e9cf69675210c8dca299cc8ba47dd1fcb1b91d83dba957ce9e4a0ec4aeaa03a098f34d87b98e')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel
}

check() {
    cd "${_name}-${pkgver}"
    export HYPRLAND_INSTANCE_SIGNATURE=0 ; python -c "import hyprpy"
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
