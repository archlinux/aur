# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=python-pysmt-git
pkgdesc="A library for SMT formulae manipulation and solving"
url="https://github.com/pysmt/pysmt"
pkgver=0.8.0.r81.gf9a5f11
pkgrel=1
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-six')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
license=('Apache')
source=("$pkgname::git+https://github.com/pysmt/pysmt.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
