# Maintainer: awe00 < awe00 AT hotmail DOT fr>

pkgbase=python-rfoo-git
pkgname=python-rfoo-git
_name=rfoo
pkgver=r10.8688a3e
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/aaiyer/rfoo"
license=('Apache')
makedepends=('cython' 'git')
depends=('python')
source=("git+https://github.com/aaiyer/rfoo.git" "setup.py.patch")
sha512sums=('SKIP' 'SKIP')
provides=("${pkgname%}")
conflicts=("${pkgname%}")

pkgver() {
  # Git, no tags available
  cd "$srcdir/${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_name}"
}

build() {
  cd "$srcdir/${_name}"
  patch -Np1 -i $srcdir/setup.py.patch
  python setup.py build
}

package() {
  cd "$srcdir/${_name}"
  python setup.py install --root="${pkgdir}"
}
