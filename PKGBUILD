# Maintainer: Bet4 <0xbet4@gmail.com>

_pkgname=supermin
pkgname=${_pkgname}-git
pkgver=5.2.0.r12.g4c019ae
pkgrel=1
pkgdesc="Tool for creating supermin appliances"
arch=('x86_64')
url="http://people.redhat.com/~rjones/supermin/"
license=('GPL')
makedepends=('ocaml' 'ocaml-findlib')
depends=('e2fsprogs' 'pacman' 'pacman-contrib' 'cpio')
provides=(${_pkgname})
conflicts=('febootstrap<=3.21' ${_pkgname})
source=("$pkgname::git+https://github.com/libguestfs/supermin.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"

  ./autogen.sh
}

build() {
  cd "${pkgname}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}/" install
}
