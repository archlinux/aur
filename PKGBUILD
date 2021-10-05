# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Eric Toombs

pkgname=python-binance-git
pkgver=1.0.15.r2.g217f1e2
pkgrel=1
pkgdesc="An unofficial Python wrapper for the Binance exchange REST API"
arch=('any')
url="https://github.com/sammchardy/python-binance"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-dateparser'
         'python-requests' 'python-ujson' 'python-websockets=9.1')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/sammchardy/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
    cd "${pkgname%-git}"
    python setup.py build
}

package() {
    cd "${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
