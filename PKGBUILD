# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

pkgname='python-pltable-git'
pkgver=1.0.2
pkgrel=1
pkgdesc="Python library designed to make it quick and easy to represent tabular data in visually appealing text tables"
arch=('any')
url='https://github.com/platomav/PLTable'
license=('BSD')
depends=('python')
conflicts=('python-pltable')
provides=('python-pltable')
makedepends=('git' 'python-setuptools')
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

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
