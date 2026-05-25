# Maintainer: Mikhail <efklid@gmail.com>
# shellcheck disable=SC2034,SC2154
pkgname=refract
pkgver=1.4.3
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
sha256sums=('7c05b35b95610fa9c60c18b2d40d5e01d87a279d01ad0501efc0ceb77ba61eeb')

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
