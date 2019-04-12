# Maintainer: Roberto Nobrega <rwnobrega@gmail.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: dcraven <dcraven@gmail.com>

pkgname=bless-git
_gitname=bless
pkgver=r169.db747af
pkgrel=1
pkgdesc="High-quality, full-featured hex editor (git version)"
arch=('any')
url="https://github.com/afrantzis/bless"
license=('GPL')
depends=('gtk-sharp-2')
conflicts=('bless')
makedepends=('rarian' 'automake')
source=("git://github.com/afrantzis/bless.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_gitname}/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/${_gitname}
  ./autogen.sh
}

build() {
  cd ${srcdir}/${_gitname}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR="${pkgdir}" MKDIR_P='mkdir -p' install
}
