# Maintainer: Zack Didcott

pkgname=wifipumpkin3-git
_pkgname=wifipumpkin3
pkgver=1.1.7.r2.g344a475
pkgrel=1
pkgdesc="Powerful framework for rogue access point attack"
depends=(
    'hostapd'
    'iw'
    'python-netifaces'
    'python-dhcplib-git'
    'python-tabulate'
    'python-urwid'
    'python-termcolor'
    'python-twisted'
    'python-pyqt5'
    'python-pyqt5-sip'
    'python-pyopenssl'
    'python-dnslib'
    'python-loguru'
    'python-scapy'
    'python-isc-dhcp-leases'
    'python-dnspython'
    'python-flask'
    'python-requests'
    'python-beautifulsoup4'
    'python-pyjwt'
    'python-flask-restful'
    'python-aiofile'
    'python-ping3'
)
makedepends=('git' 'python-setuptools')
provides=("wifipumpkin3")
conflicts=("wifipumpkin3")
arch=('i686' 'x86_64')
url="https://github.com/P0cL4bs/wifipumpkin3"
license=('Apache-2.0')
source=("git+https://github.com/P0cL4bs/wifipumpkin3.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    git -C "${srcdir}/${_pkgname}" clean -dfx
}

build() {
    cd "$_pkgname"
    python3 setup.py build
}

package() {
    cd "$_pkgname"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname"
    python3 -m unittest
}