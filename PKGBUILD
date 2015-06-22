# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Former Maintainers: Evan Martin <martine@danga.com>, Andy Smith <andy@term.ie>
# Packager: Samir Faci <csgeek@esamir.com>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=git-bzr-ng
pkgver=61.9878a30
pkgrel=1
pkgdesc="bi-directional git to bzr bridge: never fear bzr again"
arch=('any')
url="http://github.com/termie/git-bzr-ng"
license=('GPL')
depends=('git' 'bzr' 'bzr-fastimport')
makedepends=()

source=('git+http://github.com/termie/git-bzr-ng.git')
md5sums=("SKIP")

pkgver() {
  cd git-bzr-ng
  revision=$(git rev-list --count HEAD)
  hash=$(git log --pretty=format:'%h' -n 1)
  echo $revision.$hash
}

build() {
  cd git-bzr-ng

   # python2 fix
  for file in $(find . -type f -name '*' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd git-bzr-ng
  install -d "${pkgdir}/usr/lib/git-core/"
  install -o root -g root -m655 git-bzr ${pkgdir}/usr/lib/git-core/
}
