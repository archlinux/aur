# Maintainer:	Malstrond <malstrond@gmail.com>
# Contributor:	xduugu

pkgname=dyndnsc
pkgver=0.5.1
pkgrel=0
pkgdesc="Dynamic DNS client with support for multiple protocols and services. Compatible with IPv6 dual stack."
arch=('any')
url="https://pypi.org/project/dyndnsc"
license=('MIT')
depends=('python-argparse' 'python-ipy' 'python-ndg-httpsclient' 'python-requests' 'python-setuptools' 'python-netifaces')
source=("https://pypi.python.org/packages/source/d/dyndnsc/dyndnsc-$pkgver.tar.gz"
        'dyndnsc.service')
md5sums=('55bc511dbc6d9a9d46f89bcfaa70f37c'
         '4b2cd825c387494ba77ad78106dd42eb')

build() {
    cd "$srcdir/dyndnsc-$pkgver"
    python setup.py build
}

package() {
    cd "dyndnsc-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    # install systemd service file
    install -Dm644 "$srcdir/dyndnsc.service" "$pkgdir/usr/lib/systemd/system/dyndnsc.service"

    # install license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
