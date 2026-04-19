# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

_pkgname=siun
pkgname=$_pkgname
pkgver=2.0.1
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
b2sums=('2bac6874dbdc674c7a85e9a454ff53c2a3306dfe75d766f3133f2fc77b3827d471e0d435831baa29d40af853f4ad7ea6a762666f61641263db5375b39fa840d4')


build() {
    cd siun-"${pkgver}"
    uv build --wheel
}

package() {
    cd siun-"${pkgver}"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
