# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Malstrond <malstrond@gmail.com>
# Contributor: xduugu

pkgname=dyndnsc
_pkgname=python-dyndnsc
pkgver=0.6.0
pkgrel=1
pkgdesc="Dynamic DNS client with support for multiple protocols and services. Compatible with IPv6 dual stack."
arch=('any')
url="https://pypi.org/project/dyndnsc"
license=('MIT')
depends=('python-requests' 'python-setuptools' 'python-netifaces' 'python-dnspython' 'python-daemonocle' 'python-json-logging')
makedepends=('python-pip' 'python-wheel')
source=("https://github.com/infothrill/$_pkgname/archive/$pkgver.zip"
        'dyndnsc.service')
sha256sums=('ff0fcd735e96a958fdce51910d962f064c0da6b4b9723e929c1a1e5de2570df0'
            '06e5088696dd2cd6e9af9de51bf0c88e94adadd582cd66620bc260caaf56059c')

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
