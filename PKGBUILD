# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contributor: Hermann Höhne <hoehermann@gmx.de>

pkgname=purple-gowhatsapp
pkgver=1.18.0
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for WhatsApp Web, Powered by go-whatsapp"
arch=('x86_64' 'i686')
url="https://github.com/hoehermann/purple-gowhatsapp"
license=('GPLv3')
depends=('libpurple')
makedepends=('go' 'cmake' )
optdepends=("gdk-pixbuf2: Pictures", "opusfile: Sound")
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hoehermann/purple-gowhatsapp/archive/refs/tags/v${pkgver}.tar.gz" "purple-config.cmake")
sha256sums=('878fcfcc714dc375f9e10c5b13543a5c45f344ce219e41766d2f5643da57ff39'
            'acf2329cfb20ceea7aa0f58d15b52daffd408afeb5f1a3656ffd8e2260f7e67a')
build() {
  cp purple-config.cmake "${srcdir}/${pkgname}-${pkgver}/scripts/purple-cmake"
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -G "Unix Makefiles" ..
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install/strip
}
