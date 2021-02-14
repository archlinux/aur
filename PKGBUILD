# Maintainer: Paul Irofti <paul@irofti.net>

pkgname="python-nimfa-git"
pkgver=1.3.5.r10.g3564bf6
pkgrel=1
pkgdesc="Nonnegative matrix factorization in Python"
url="https://github.com/mims-harvard/nimfa"
depends=('python' 'python-numpy' 'python-scipy')
makedepends=('git' 'python' 'python-setuptools')
provides=('python-nimfa')
conflicts=('python-nimfa')
arch=('any')
license=('BSD')
source=("git+https://github.com/mims-harvard/nimfa")
md5sums=('SKIP')

pkgver() {
    cd "nimfa"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build(){
  cd "nimfa"
  python setup.py build
}

package() {
  cd "nimfa"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 COPYING.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING.txt
}
# vim:ts=2:sw=2:et:
