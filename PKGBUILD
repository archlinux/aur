# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Alex Dewar <alex.dewar@gmx.co.uk>
pkgname=pwclient
pkgver=2.8.0
pkgrel=1
pkgdesc='The command-line client for the patchwork patch tracking tool'
arch=('any')
url="https://github.com/getpatchwork/$pkgname"
license=('GPL-2.0-or-later')
depends=('python' 'python-importlib-metadata')
makedepends=(
    'python-build'
    'python-installer'
    'python-pbr'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-mock' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bf843466ede37268fa830c7d272f6fddadad69a924e3a49e05250829c25873c7')

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
