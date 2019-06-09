# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=hexchat-otr-git
pkgver=r52.g22d5495
pkgrel=1
pkgdesc="OTR support for hexchat"
url="https://github.com/TingPing/hexchat-otr"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('hexchat' 'libotr>=4.1.0')
makedepends=('git' 'meson')
conflicts=('hexchat-otr')
provides=('hexchat-otr')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.g%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  arch-meson build -D local_install=false
  ninja -C build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
