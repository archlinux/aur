# Maintainer: Mikhail <efklid@gmail.com>
# shellcheck disable=SC2034,SC2154
pkgname=refract
pkgver=1.5.0
pkgrel=1
pkgdesc="GUI tool for ranking pacman mirrors on Arch Linux and Arch-based distributions"
arch=('any')
url="https://github.com/Labaman/refract"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-requests'
    'python-gobject'
    'gtk4'
    'polkit'
)
optdepends=(
    'rsync: speed testing for rsync mirrors'
    'geoip: country auto-detection via geoiplookup'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Labaman/refract/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8aa596e61e185f4644b245345a86850941e30b6a576c90091f8a8ecb70b17665')

build() {
    cd "$pkgname-$pkgver" || return 1
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver" || return 1
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 refract.desktop "$pkgdir/usr/share/applications/refract.desktop"
    install -Dm644 refract.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/refract.svg"
}
