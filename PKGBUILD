# Maintainer: Mikhail <efklid@gmail.com>
# shellcheck disable=SC2034,SC2154
pkgname=refract
pkgver=1.3.0
pkgrel=1
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
sha256sums=('c5381597c675138f9459c11f436205cc12631afb85a7bce5a964e6c555a77d86')

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
