# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Malstrond <malstrond@gmail.com>
# Contributor: xduugu

pkgname=dyndnsc
_pkgname=python-dyndnsc
pkgver=0.6.1
pkgrel=1
pkgdesc="Dynamic DNS client with support for multiple protocols and services. Compatible with IPv6 dual stack."
arch=('any')
url="https://pypi.org/project/dyndnsc"
license=('MIT')
depends=('python-requests' 'python-netifaces' 'python-dnspython' 'python-daemonocle' 'python-json-logging')
makedepends=('python-pip' 'python-wheel' 'python-setuptools')
source=("https://github.com/infothrill/$_pkgname/archive/$pkgver.zip"
        'dyndnsc.service')
sha256sums=('b85a1dd2c9d43c0573ff98421a0cdec8229edbd6ca9d973fa8281b6b7a5c9920'
            '6af0da619924475f346400a943645875a175d97998d065b904eb9330168da6ea')

build() {
    cd "$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # install systemd service file
    install -Dm644 "$srcdir/dyndnsc.service" "$pkgdir/usr/lib/systemd/system/dyndnsc.service"

    # install license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
