# Maintainer: Xavier Gongora <ixbalanque@protonmail.ch>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Wolfgang Popp <mail@wolfgang-popp.de>
# Contributor: Tharre <tharre3@gmail.com>
# Contributor: Damien Flament <damien.flament at gmx dot com>

pkgname=brittany
pkgver=0.13.1.2
pkgrel=1
pkgdesc='Haskell source code formatter (static)'
arch=(x86_64)
url='https://github.com/lspitzner/brittany'
license=(AGPL3)
makedepends=(git stack)
_tag=434f9f8e49b847ef3e648672c5564b6dd0d3be67 # git rev-parse $pkgver
source=("git+$url.git?signed#tag=$_tag")
b2sums=('SKIP')

pkgver() { # prevents accidentally bumping pkgver without updating _tag as well
    cd "$pkgname"
    git describe --tags | sed 's/^v//' # get version tag and remove the first 'v' in the head if present
}


build() {
  cd $pkgname
  stack build
}

package() {
  cd $pkgname
  stack install --local-bin-path "$pkgdir/usr/bin"
}
