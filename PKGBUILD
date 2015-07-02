# Maintainer: Christoph J. Thompson <thompsonc@protonmail.ch>

pkgname=hexchat-otr-git
pkgver=r25.g2845436
pkgrel=1
pkgdesc="OTR support for hexchat"
arch=('i686' 'x86_64')
depends=('hexchat' 'libotr>=4.1.0')
makedepends=('git' 'gnome-common')
url="https://github.com/TingPing/hexchat-otr"
license=('GPL2')
source=("${pkgname}::git+https://github.com/TingPing/hexchat-otr")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}

