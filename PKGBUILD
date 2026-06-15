# Maintainer: Mikhail <efklid@gmail.com>
# shellcheck disable=SC2034,SC2154
pkgname=refractum
pkgver=1.6.6
pkgrel=1
pkgdesc="GUI tool for ranking pacman mirrors on Arch Linux and Arch-based distributions"
arch=('any')
url="https://github.com/Labaman/refractum"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-requests'
    'python-gobject'
    'gtk4'
    'polkit'
)
optdepends=(
    'geoip: country auto-detection via geoiplookup'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Labaman/refractum/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec7751222d9a5cad3d03dae661066830f3f7ca46f3462c0db7e0bb0c0077cfe9')
install=refractum.install

build() {
    cd "$pkgname-$pkgver" || return 1
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver" || return 1
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 io.github.Labaman.refractum.desktop "$pkgdir/usr/share/applications/io.github.Labaman.refractum.desktop"
    install -Dm644 io.github.Labaman.refractum.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.Labaman.refractum.svg"
}
