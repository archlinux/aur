# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

pkgname=python-ngshare-exchange-git
_pkg=ngshare_exchange
pkgver=0.5.3.r3.gdba2c43
pkgrel=1
pkgdesc="Custom nbgrader exchange to be used with ngshare"
arch=(any)
url="https://github.com/lahwaacz/ngshare_exchange"
license=(BSD-3-Clause)
depends=(
    python
    jupyter-nbgrader
)
makedepends=(
    git
    python-build
    python-installer
    python-setuptools
    python-wheel
)
checkdepends=(
    python-pytest
    python-requests-mock
)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "$_pkg"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkg"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkg"
    python -m pytest
}

package() {
    cd "$_pkg"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
