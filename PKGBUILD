# Maintainer: DrRac27 <drrac27 at riseup dot net>

pkgname=karoto
pkgver=0.2
pkgrel=1
pkgdesc='A shopping list app for Linux Mobile.'
arch=('any')
url='https://codeberg.org/DrRac27/karoto'
license=('MIT')
depends=('python-pyqt6')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-pytest-qt' 'flake8')
_commit="19417c116fef4a6bb91ef7ed465781a5811cff07"  # tag 0.2
source=("git+$url.git#commit=$_commit")
sha512sums=('SKIP')

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
