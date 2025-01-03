# Maintainer: Joffrey <j-off@live.fr>

pkgname='certbot-dns-bookmyname'
pkgver=1.0.0
pkgrel=1
pkgdesc='BookMyName DNS Authenticator plugin for Certbot'
arch=('any')
url="https://github.com/Joffr3y/$pkgname"
license=('Apache-2.0')
depends=(
    'certbot'
    'python-requests'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('64199966e9b1ac2ff21b79cc8151b9a486ad261a6b460dc64ffb4ac8ec05f0e4')

check() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m pytest -v -W ignore::DeprecationWarning
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
