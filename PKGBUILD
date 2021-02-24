# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Malstrond <malstrond@gmail.com>
# Contributor: xduugu

pkgname=dyndnsc-git
_pkgbase=python-dyndnsc
pkgver=0.6.0.r2.g539eb97
pkgrel=1
pkgdesc="Dynamic DNS client with support for multiple protocols and services. Compatible with IPv6 dual stack. Git version"
arch=('any')
url="https://pypi.org/project/dyndnsc"
license=('MIT')
depends=('python-requests' 'python-setuptools' 'python-netifaces' 'python-dnspython' 'python-daemonocle' 'python-json-logging')
makedepends=('git' 'python-pip' 'python-wheel')
provides=('dyndnsc')
conflicts=('dyndnsc')
source=("git+https://github.com/infothrill/$_pkgbase.git"
        'dyndnsc.service')
sha256sums=('SKIP'
            '06e5088696dd2cd6e9af9de51bf0c88e94adadd582cd66620bc260caaf56059c')

build() {
    cd "$_pkgbase"
    python setup.py build
}

package() {
    cd "$_pkgbase"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # install systemd service file
    install -Dm644 "$srcdir/dyndnsc.service" "$pkgdir/usr/lib/systemd/system/dyndnsc.service"

    # install license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
