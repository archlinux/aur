# Maintainer: 0x2501 <0x2501@sol740.net>
pkgname=tvmv-git
pkgver=0.6.0.r1.g17b360e
pkgrel=1
pkgdesc='Command-line tool to bulk-rename TV episode files with minimal fuss.'
arch=('x86_64')
url='https://github.com/keithfancher/tvmv'
license=('GPL-3.0-or-later')
makedepends=('git' 'stack-bin')
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/tvmv"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/tvmv"
  stack --local-bin-path $(pwd) build --copy-bins
}

package() {
  install -Dm755 "$srcdir/tvmv/tvmv" "$pkgdir/usr/local/bin/tvmv"
}
