# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Eric Toombs

_pkgname='python-binance'
pkgname="$_pkgname-git"
pkgver=1.0.15.r0.gd76df56
pkgrel=1
pkgdesc="simple python interface to binance.com's web API"
arch=('any')
url='https://github.com/sammchardy/python-binance'
license=('MIT')
depends=('python' 'python-aiohttp' 'python-dateparser'
         'python-requests' 'python-ujson' 'python-websockets=9.1')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/sammchardy/python-binance.git')
md5sums=('SKIP')


pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -D 'LICENSE' "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
