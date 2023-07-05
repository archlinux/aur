# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>

_pkgname=python-pycpa
pkgname=$_pkgname-git
pkgver=r512.824e794
pkgrel=1
pkgdesc="Pragmatic Python implementation of Compositional Performance Analysis (aka the SymTA/S approach provided by Symtavision) used for research in worst-case timing analysis."
arch=('any')
makedepends=('git' 'python-setuptools')
replaces=('python-pycpa-hg')
depends=('python' 'python-matplotlib' 'python-pygraphviz')
provides=('python-pycpa')
url="https://github.com/IDA-TUBS/pycpa.git"
license=('MIT')

source=("git+https://github.com/IDA-TUBS/pycpa.git")
md5sums=("SKIP")

pkgver() {
  cd "${srcdir}/pycpa"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${srcdir}/pycpa
  python setup.py build
}

package() {
  cd ${srcdir}/pycpa
  python setup.py install --root="${pkgdir}"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
