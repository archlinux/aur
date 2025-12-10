pkgname=kpa
pkgver=2.0.0
pkgrel=1
pkgdesc="KevinCrrl Python AUR Helper"
arch=('any')
url="https://github.com/KevinCrrl/kpa"
license=('GPL3-or-later')
source=("${url}/archive/refs/tags/${pkgver}/${pkgver}.tar.gz")
sha512sums=("b812faeaa40927f72420a72751d5efabbd02b09eb95a7ab26cc32794f8237b5deebef6af085676c37cdb07415624a81edcbfa8a9e8ddba881801558e16460ca2")
conflicts=('kpa-bin')
depends=(
    'python'
    'python-pyxdg'
    'python-jsonschema'
    'python-colorama'
    'python-pkgbuild-parser'
    'python-requests'
    'git'
    'base-devel'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
optdepends=(
    'sudo'
    'opendoas'
    'polkit'
    'doas'
    'proxychains-ng'
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
