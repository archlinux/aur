# Maintainer: Térence Clastres <t dot clastres at gmail dot com>

pkgname=filefinder-git
_pkgname=filefinder
pkgver=r82.8c4616a
pkgrel=1
pkgdesc="A GTK3 lightweight file finder app written in Vala"
arch=('x86_64' 'i686')
url="https://github.com/konkor/filefinder"
license=('GPL3')
depends=('gtk3')
makedepends=('git' 'vala')
provides=('filefinder-git')
conflicts=('filefinder-git')
source=('git+https://github.com/konkor/filefinder')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  ./autogen.sh
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install
}
