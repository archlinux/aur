# Maintainer: Fredrick Brennan <copypaste@kittens.ph>

pkgname=deskew-git
_name=deskew
_user=galfar
pkgrel=1
pkgver=v1.30.r15.gb8f5ff6
pkgdesc="deskew is a command-line program which deskews images containing text"
arch=("any")
url="http://jwilk.net/software/deskew"
license=('MIT')
makedepends=('fpc')
source=("${_name}::git+https://github.com/${_user}/${_name}")
provides=('deskew')
md5sums=("SKIP")

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_name"
  cd Scripts
  # Change \r\n to \n
  tr -d '\r' < Compile.bat > compile.sh
  chmod +x compile.sh
  # This file just makes a dir. & calls `fpc` as of when I wrote this PKGBUILD
  ./compile.sh
  install -D "$srcdir/${_name}/Bin/deskew" "$pkgdir/usr/bin/deskew"
}
