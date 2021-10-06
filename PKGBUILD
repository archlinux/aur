# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Eric Toombs

_pkgname=python-binance
pkgname=$_pkgname-git
pkgver=1.0.15.r2.g217f1e2
pkgrel=1
pkgdesc="An unofficial Python wrapper for the Binance exchange REST API"
arch=('any')
url="https://github.com/sammchardy/python-binance"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-dateparser'
         'python-requests' 'python-ujson' 'python-websockets=9.1')
makedepends=('git' 'python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/sammchardy/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    python setup.py build
}

package() {
    cd $_pkgname
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname
}
