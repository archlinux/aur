# Maintainer: Zack Didcott

pkgname=python-dhcplib-git
_pkgname=dhcplib
pkgver=0.1.1.r0.gf13f91c
pkgrel=1
pkgdesc="Pure-Python, spec-compliant DHCP-packet-processing library "
makedepends=('git' 'python-setuptools')
provides=("python-dhcplib")
conflicts=("python-dhcplib")
arch=('i686' 'x86_64')
url="https://github.com/jansegre/dhcplib/"
source=("git+https://github.com/jansegre/dhcplib.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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