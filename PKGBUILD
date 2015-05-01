# Maintainer: Vianney le Clément <vleclement AT gmail·com>
_pkgname=bootimgtool
pkgname=$_pkgname-git
pkgver=20150501.g1c6e2bf
pkgrel=1
pkgdesc="Android boot.img extractor/assembler handling multiple variants"
arch=('i686' 'x86_64')
url="https://github.com/vianney/bootimgtool"
license=('GPL3')
depends=('openssl')
makedepends=('git' 'autoconf' 'automake')
source=("git://github.com/vianney/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  _date=$(git show -s --format='%ci' | cut -d' ' -f1 | sed 's/-//g')
  _hash=$(git show -s --format='%h')
  echo "$_date.g$_hash"
}

build() {
  cd "$srcdir/$_pkgname"
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make install DESTDIR="$pkgdir"
}
