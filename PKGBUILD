# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contributor: Hermann Höhne <hoehermann@gmx.de>

pkgname=purple-gowhatsapp
pkgver=1.19.0
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
sha256sums=('4db5702a59f569778631bc28f2a01d8112d4f6907369fa33f062ca97c53a0008'
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
