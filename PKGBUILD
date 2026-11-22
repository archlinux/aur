# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Maintainer: Kim Scarborough <kim@scarborough.kim>

pkgname=deskew-git
_name=deskew
_user=galfar
pkgrel=1
pkgver=1.30.r114.ge5967a0
pkgdesc="A command-line program for automatically straightening images"
arch=("x86_64" "aarch64")
url="http://jwilk.net/software/deskew"
license=('MPL-2.0')
makedepends=('fpc' 'git')
depends=('glibc')
source=("${_name}::git+https://github.com/${_user}/${_name}")
provides=('deskew')
conflicts=('deskew')
b2sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_name/Scripts"
  ./compile.sh
}

package() {
  install -D "$srcdir/${_name}/Bin/deskew" "$pkgdir/usr/bin/deskew"
}

# vim: syntax=bash
