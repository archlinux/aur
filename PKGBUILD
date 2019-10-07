# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

pkgname='python-pltable-git'
pkgver=1.0.0
pkgrel=1
pkgdesc="PLTable is a Python library designed to make it quick and easy to represent tabular data in visually appealing ASCII tables."
arch=('any')
url='https://github.com/platomav/PLTable'
license=('BSD')
depends=('python')
makedepends=('git' 'python' 'python-setuptools')
conflicts=('python-prettytable')
source=("$pkgname::git+https://github.com/platomav/PLTable")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    local v_ver=$(python setup.py -V | sed 's/-//')
    printf "%s" "$v_ver"
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install python packages to $pkgdir
    python setup.py install --root ${pkgdir}

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}