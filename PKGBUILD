# Maintainer: Mikhail <efklid@gmail.com>
# shellcheck disable=SC2034,SC2154
pkgname=refract
pkgver=1.4.2
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
    'reflector'
    'polkit'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Labaman/refract/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72e38c28b3b7bdd85c114d0c5d38aea48d92ddcfb6668611f06b24d1d7b31bac')

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
