# Maintainer: Will Price <will.price94@gmail.com>
pkgname=python-migen-git
pkgrel=1
pkgdesc="A  python toolbox for building complex digital hardware"
arch=(any)
url="https://github.com/m-labs/migen"
license=('BSD')
makedepends=('git' 'python-setuptools')
depends=('python')
checkdepends=('python-pytest')
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
replaces=('migen-git')
source=('git+https://github.com/m-labs/migen.git')
md5sums=('SKIP')
pkgver=0.9.2.rcc6e76e

pkgver() {
  cd "${srcdir}/migen"
  git describe --long --tags | sed 's/\([^-]*-g\)/r/;s/-/./g'
}

build() {
  cd "${srcdir}/migen"
  python setup.py build
}

check() {
  cd "${srcdir}/migen"
  env PYTHONPATH=. pytest
}

package() {
  cd "${srcdir}/migen"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
