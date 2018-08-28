# Maintainer: Christoph J. Thompson <thompsonc at protonmail dot ch>

pkgname=hexchat-otr-git
pkgver=r50.ga7a6016
pkgrel=2
pkgdesc="OTR support for hexchat"
url="https://github.com/TingPing/hexchat-otr"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('hexchat' 'libotr>=4.1.0')
makedepends=('git' 'gnome-common')
conflicts=('hexchat-otr')
provides=('hexchat-otr')
source=("${pkgname}::git+${url}")
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
  CFLAGS="${CFLAGS}" ./configure --prefix="/usr"
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
