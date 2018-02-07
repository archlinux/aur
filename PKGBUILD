# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=hairless-midiserial
pkgname=$_pkgname-git
pkgver=0.r80.a558766
pkgrel=1
pkgdesc="Lightweight cross-platform GUI-based MIDI/Serial bridge"
arch=('i686' 'x86_64')
url="http://projectgus.github.io/hairless-midiserial"
license=('LGPL')
depends=('qt4')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/projectgus/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule update --init
  qmake-qt4
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

# vim:set ts=2 sw=2 et:
