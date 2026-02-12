# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

_pkgname=lru-dict
pkgname="python-lru-dict"
pkgver=1.5.0
pkgrel=1
pkgdesc="A dict like LRU container."
arch=('x86_64')
url="https://github.com/amitdev/lru-dict"
license=("MIT")
depends=("python")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/amitdev/lru-dict/archive/refs/tags/v${pkgver}.tar.gz"
    build.patch
)
sha256sums=('831634fafa1055776d145b7dafb54da00f28fcf6fd1d75fc3fbb0018f1c3eda0'
            'dc280c447bcfe9cf4b7fd23e1ca091abd479ea3ce0c97d223ba6455f4b1d8085')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -p1 <../build.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
