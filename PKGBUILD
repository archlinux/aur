# Maintainer: Fredrick Brennan <copypaste@kittens.ph>

pkgname=deskew-hg
_hgname=app-deskew
_bbuser=galfar
pkgrel=1
pkgver=89.a33d5fb77b06
pkgdesc="deskew is a command-line program which deskews images containing text"
arch=("any")
url="http://jwilk.net/software/deskew"
license=('MIT')
makedepends=('mercurial' 'fpc')
source=("${_hgname}::hg+https://bitbucket.org/${_bbuser}/${_hgname}")
provides=('deskew')
md5sums=("SKIP")

pkgver() {
  cd "$_hgname"
  echo "$(hg identify -n).$(hg identify -i)"
}

package() {
  cd "$_hgname"
  cd Scripts
  # Change \r\n to \n
  tr -d '\r' < Compile.bat > compile.sh
  chmod +x compile.sh
  # This file just makes a dir. & calls `fpc` as of when I wrote this PKGBUILD
  ./compile.sh
  install -D "$srcdir/${_hgname}/Bin/deskew" "$pkgdir/usr/bin/deskew"
}
