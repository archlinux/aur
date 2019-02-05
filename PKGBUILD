# Maintainer: sedot <aur at fry dot fastmail dot com>
pkgname=python-pymonetdb-git
pkgver=1.1.1.r3.g25c0f80
pkgrel=1
pkgdesc="MonetDB Python bindings."
arch=('x86_64')
url="https://github.com/gijzelaerr/pymonetdb"
license=('BSD')
depends=('monetdb')
makedepends=('git' 'python-setuptools')
provides=('python-pymonetdb')
source=("git+https://github.com/gijzelaerr/pymonetdb")
sha512sums=('SKIP')

pkgver() {
    cd ${srcdir}/pymonetdb
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/pymonetdb
    python setup.py build
}

package() {
    cd ${srcdir}/pymonetdb
    python setup.py install --root "$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
