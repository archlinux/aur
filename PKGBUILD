# Maintainer: Myles English <myles at rockhead dot biz>
pkgname=ufl-git
pkgdesc="Unified form language."
pkgver=20140711
pkgrel=1
_branch=master
arch=('i686' 'x86_64')
url="https://bitbucket.org/fenics-project/ufl"
license=('LGPL')
groups=('fenics-git')
depends=('python2' 'python2-six')
makedepends=('git' 'python2')
provides=('ufl')
conflicts=('ufl')
options=(!emptydirs)
source=("ufl::git+https://bitbucket.org/fenics-project/ufl.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
  cd ufl
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}

prepare() {
  cd ufl
  find ./ -name "*" -type f -exec \
      sed -i 's|^#!.*python$|#!/usr/bin/python2|' {} \;
}

build() {
  cd ufl
  python2 setup.py build
}

package() {
  cd ufl
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}
