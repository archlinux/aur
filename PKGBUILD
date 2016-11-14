# Maintainer: Sirat18 <aur@sirat18.de>

pkgname=halberd-git
_gitname='halberd'
_gitroot='https://github.com/jmbr/halberd.git'
pkgver=r317.3d167a0
pkgrel=1
pkgdesc='Tool to discover HTTP load balancers'
arch=('any')
url='https://github.com/jmbr/halberd'
license=('GPL')
depends=('python2')
provides=('halberd')
conflicts=('halberd')
makedepends=('python2-setuptools' 'git' 'help2man' 'epydoc')

source=("$_gitname"::"git+$_gitroot")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  sed -i '1s|#!/usr/bin/env python$|#!/usr/bin/env python2|' scripts/halberd
  mkdir -p man/man1
  help2man --include help2man.cfg --no-info scripts/halberd --output man/man1/halberd.1
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
