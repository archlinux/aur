# Maintainer: jojo7682345 <jojo7682345@gmail.com>
pkgbase=avbuilder
pkgname=avbuilder-git
pkgver=v0.1
pkgrel=1
pkgdesc="A flexible build system written in C"
arch=('x86_64')
url="https://github.com/jojo7682345/avBuilder.git"
license=('MIT')
makedepends=(git)
provides=(avBuilder)
source=("git+$url")
md5sums=('SKIP') 

pkgver(){
  cd "avBuilder"
  printf "v0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
  cd "avBuilder"
  git submodule update --init --recursive
  chmod +x ./bootstrap
  ./bootstrap
  ./avBuilder avBuilder.project
}

package() {
  cd "avBuilder"
  ./bootstrap install $pkgdir/usr/bin/avBuilder
  ./avBuilder save ./library/c/stdc.project std/c
  ./avBuilder save ./library/project/import.project std/project
}
