# Maintainer: sedot <aur at fry dot fastmail dot com>
pkgname=python-pdal-git
pkgver=2.1.8.r0.g37328e3
pkgrel=1
pkgdesc="PDAL Python bindings."
arch=('x86_64')
url="https://github.com/PDAL/python"
license=('BSD')
depends=('pdal' 'python')
makedepends=('git' 'cython' 'python-numpy')
provides=('python-pdal')
source=("git+https://github.com/PDAL/python")
sha512sums=('SKIP')

pkgver() {
    cd ${srcdir}/python
    git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd ${srcdir}/python
    python setup.py build
}

package() {
    cd ${srcdir}/python
    python setup.py install --root "$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
