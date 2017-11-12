# Maintainer: vsilv vsilv@posteo.eu

pkgname=python-bintrees-git
pkgver=r206.667002a
pkgrel=1
pkgdesc='Package provides Binary-, RedBlack- and AVL-Trees in Python and Cython.'
arch=('x86_64')
url="https://github.com/mozman/bintrees/"
license=('custom')
depends=('python')
makedepends=('python-setuptools' 'git')
provides=('python-bintrees-git')
conflicts=('python-bintrees')
_gitname=python-bintrees
source=(${_gitname}"::git+https://github.com/mozman/bintrees.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  sudo cp ./LICENSE.txt /usr/share/licenses/${pkgname}
  python setup.py install --prefix=/usr --root=${pkgdir} -O1 --skip-build
}

