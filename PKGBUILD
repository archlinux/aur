# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
pkgname=python2-larch-git
pkgver=0.0.0
pkgrel=1
pkgdesc="Python B-tree library"
arch=('i686' 'x86_64')
url="http://liw.fi/larch/"
license=('GPL3')
groups=()
depends=('python2' 'python2-tracing-git')
makedepends=('git')
provides=('python2-larch')
conflicts=('python2-larch')
replaces=('python2-larch-bzr')
backup=()
options=()
install=
source=("$pkgname::git://git.liw.fi/larch")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"
  find . -type f -exec sed -ri "s|^#!/usr/bin/python$|&2|g" '{}' '+'
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
