# Maintainer: Jacob Jenner Rasmussen <jacob at jener dot dk>

_pkgname=acdcontrol
pkgname=$_pkgname-git
pkgver=13.ee9f85a
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="https://github.com/jenrik/acdcontrol.git"
license=('GPL')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/jenrik/acdcontrol.git")
sha256sums=('SKIP')

_gitroot="https://github.com/jenrik/acdcontrol.git"

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/$_pkgname"
  make
  make 99-acdcontrol.rules
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 "$srcdir/$_pkgname/acdcontrol" "$pkgdir/usr/bin/acdcontrol"
  mkdir -p "$pkgdir/etc/udev/rules.d/"
  install -m644 "$srcdir/$_pkgname/99-acdcontrol.rules" "$pkgdir/etc/udev/rules.d/99-acdcontrol.rules"
}

# vim:set ts=2 sw=2 et:
