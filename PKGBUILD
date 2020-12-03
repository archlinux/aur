# Maintainer: pumpkincheshire <sollyonzou at gmail dot com>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
pkgname=python-eve-git
pkgver=1.1.4.r10.g9e0cfbf2
pkgrel=1
_name=eve
pkgdesc="An open source Python REST API framework designed for human beings."
arch=('any')
url="http://python-eve.org/"
license=('BSD')
depends=('python-flask' 'python-simplejson' 'python-pymongo' 'python-cerberus' 'python-events')
makedepends=('git' 'python-setuptools')
optdepends=('python-sphinx: docs' 'python-sphinx-alabaster-theme: theme for sphinx' 'python-doc8: style checker for sphinx' 'python-redis: test use' 'python-testfixtures: test use' 'python-pytest: test use' 'python-tox: test use')
conflicts=('python-eve')
provides=('python-eve')

source=("$_name::git+https://github.com/pyeve/$_name.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  python setup.py build
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
