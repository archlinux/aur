# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: jyantis <yantis@yantis.net>

_gitname=bidict
pkgname=python-bidict-git
pkgver=0.19.0.r7.g7d60b91
pkgrel=1
pkgdesc='bidirectional mapping library for Python'
arch=('any')
url='https://bidict.readthedocs.io/en/master/'
license=('ISC')
depends=('python')
makedepends=('git' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-hypothesis' 'python-sortedcollections' 'python-sortedcontainers')
provides=('python-bidict')
conflicts=('python-bidict')
source=('git+https://github.com/jab/bidict.git'
        'http://opensource.org/licenses/isc-license')
sha256sums=('SKIP'
            '19cdca72269f2b1e7918edf814eb699773c3dc426744ce74c3ff2d2520b6a508')


pkgver() {
  cd "${_gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
    cd "${_gitname}"
    python setup.py build
}

check() {
  cd "${_gitname}"
  python setup.py test --verbose
}

package() {
    install -D -m644 isc-license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"

    cd "${_gitname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
