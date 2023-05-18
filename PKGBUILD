# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Alex Dewar <alex.dewar@gmx.co.uk>
pkgname=pwclient
pkgver=2.6.2
pkgrel=1
pkgdesc='The command-line client for the patchwork patch tracking tool'
arch=('any')
url="https://github.com/getpatchwork/$pkgname"
license=('GPL')
depends=('python-importlib-metadata')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-mock' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('34865de1744a19f3b36f2223cbdb6fc17085edd26e7800b7d2b381bc0a1dec5c')

build() {
    cd "$pkgname-$pkgver"
    PBR_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    pytest
}

package() {
    cd "$pkgname-$pkgver"
    python -I -m installer --destdir="$pkgdir" dist/*.whl
    mkdir -p "$pkgdir/usr/share/man/man1"
    install -Dm644 man/pwclient.1 "$pkgdir/usr/share/man/man1/"
}
