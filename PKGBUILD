# Maintainer: minus <minus@mnus.de>

_gitname=floo
pkgname="${_gitname}-git"
_gitbranch=master
pkgver=r16.a51c6ee
pkgrel=1
pkgdesc="Interpreter for the floo programming language"
url="https://git.sr.ht/~minus/${_gitname}"
license=('MIT')
source=("git+https://git.sr.ht/~minus/${_gitname}#branch=${_gitbranch}")
sha512sums=('SKIP')
arch=('any')
depends=(
  'python'
  'python-pydot'
  'python-lark'
  'python-astor'
)
makedepends=('git')
conflicts=("${_gitname}")
provides=("${_gitname}")

pkgver() {
  cd "${srcdir}/${_gitname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set et sw=2 sts=2:
