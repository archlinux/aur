# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Eric Toombs

_pkgname='python-binance'
pkgname="$_pkgname-git"
pkgver=0.7.4.r0.gc4fdad5
pkgrel=1
pkgdesc="simple python interface to binance.com's web API"
arch=('any')
url='https://github.com/ewtoombs/python-binance'
license=('MIT')
depends=('python' 'python-autobahn' 'python-certifi' 'python-chardet' 'python-dateparser'
         'python-requests' 'python-service-identity' 'python-twisted' 'python-urllib3')
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
