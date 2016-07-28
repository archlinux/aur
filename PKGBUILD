# Maintainer: PkmX <pkmx.tw@gmail.com>
pkgname=acc-git
_pkgname=acc
pkgver=1.54.r131.gafbec00
pkgrel=1
pkgdesc="Action Code Script (ACS) compiler from ZDoom"
arch=('i686' 'x86_64')
url="https://github.com/rheit/acc"
license=('unknown')
depends=()
makedepends=('git')
provides=('acc')
conflicts=('acc')
source=("$_pkgname::git+https://github.com/rheit/acc")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  sed -e 's!/usr/local/share/acc!/usr/share/acc!' -i acc.c
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -Dm755 acc "$pkgdir/usr/bin/acc"
  install -d "$pkgdir/usr/share/acc"
  install -Dm644 *.acs "$pkgdir/usr/share/acc/"
}

# vim:set ts=2 sw=2 et:
