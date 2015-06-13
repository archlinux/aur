# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=bandicoot-git
pkgver=20110702
pkgrel=1
pkgdesc="A relational set based programming system."
url="http://bandilab.org/"
arch=('i686' 'x86_64')
license=('Apache')
depends=('glibc')
makedepends=('git')
conflicts=("bandicoot")
provides=("bandicoot")
source=('git://github.com/bandilab/bandicoot.git')
md5sums=('SKIP')

_rootname=bandicoot

pkgver() {
  cd "$_rootname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_rootname"
  case $CARCH in
    'i686')
      ./ctl dist -m32 ;;
    'x86_64')
      ./ctl dist -m64 ;;
  esac
}

package() {
  cd "$_rootname"
  install -Dm755 bandicoot-v3/bandicoot "$pkgdir/usr/bin/bandicoot"
}

