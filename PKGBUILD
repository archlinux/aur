# Maintainer: DrRac27 <drrac27 at riseup dot net>

pkgname=karoto
pkgver=0.1
pkgrel=1
pkgdesc='A shopping list app for Linux Mobile.'
arch=('any')
url='https://codeberg.org/DrRac27/karoto'
license=('MIT')
depends=('python-pyqt6')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-pytest-qt' 'flake8')
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('5640e9b8ae765c675bad74069defef32c95542ead3f3d0d85262fab71b7ccb48ad0bd3bbb0297bf8c639507d1d28197e21213503cc5dfeda730ac1459ca509b0')

prepare() {
    cd "$pkgname"
    # Remove unnecessary dependency version pinning
    sed -i 's/= "^[0-9.]*"/= "*"/' pyproject.toml
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    bash helper.sh tests
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 packaging/karoto.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/karoto.svg"
    install -Dm 644 packaging/karoto.desktop "$pkgdir/usr/share/applications/karoto.desktop"
}
