# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: cqzw555 <cqzw555@163.com>
# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python-pykickstart
pkgver=3.66
pkgrel=1
pkgdesc="python module for parsing and writing kickstart configs Resources"
arch=(any)
license=(GPL-2.0-only)
url="https://github.com/pykickstart/pykickstart"
depends=(
    'python'
    'python-requests'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/r$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('32939fb3fce50b61bf834fcb72076fc439c1861e852509d2fb8e13b039cde92ba04789cd601cd78269b4d373e7dc4eb5c6e32c19afaa8ce2633638493ef36730')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build() {
    cd "${pkgname}-$pkgver" || exit
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
}
