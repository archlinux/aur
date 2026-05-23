# Maintainer: Mikhail <efklid@gmail.com>
# shellcheck disable=SC2034,SC2154
pkgname=refract
pkgver=1.4.1
pkgrel=2
pkgdesc="GUI tool for ranking pacman mirrors on Arch Linux and Arch-based distributions"
arch=('any')
url="https://github.com/Labaman/refract"
license=('MIT')
depends=(
    'python'
    'python-requests'
    'python-gobject'
    'gtk4'
    'reflector'
    'polkit'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Labaman/refract/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('95acdabebf783c308f9f0052aa4ec5871a1274132608d0b808a3854919ecd1cb')

build() {
    cd "$pkgname-$pkgver" || return 1
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver" || return 1
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 refract.desktop "$pkgdir/usr/share/applications/refract.desktop"
    install -Dm644 refract.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/refract.svg"
}
