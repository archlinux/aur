# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

_pkgname=siun
pkgname=$_pkgname
pkgver=2.0.0
pkgrel=1
pkgdesc="siun stands for, and tries to answer, the question Should I upgrade now?"
arch=('any')
url="https://github.com/t4k1t/siun"
license=('MIT')
depends=(
    'python-click'
    'python-pydantic'
    'python-feedparser'
    'python-dbus'
)
makedepends=(
    'uv'
    'python-installer'
)
provides=($_pkgname)
source=(https://github.com/t4k1t/siun/archive/refs/tags/v"${pkgver}".tar.gz)
b2sums=('f7b00edf1e6e80aa65dc0ca210c04686f2ebe9c79e391a0cc7746c3277f11940a3ac1d1932179c686e3c2ec46258ebbdb7403052a09bdcf7937ae4dc23a41ba1')


build() {
    cd siun-"${pkgver}"
    uv build --wheel
}

package() {
    cd siun-"${pkgver}"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
