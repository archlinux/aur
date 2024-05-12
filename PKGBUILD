# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contributor: Hermann Höhne <hoehermann@gmx.de>

pkgname=purple-gowhatsapp
pkgver=1.14.0
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
sha256sums=('fdd7f6a674e4c9f9c2a969a65c6221b3097f5ed4379b788ef79cbc765defa10c'
            'a815fec89feb37ea2153f81ebd469e44a3c93a0babb35d6414cea6032044dc91')

build() {
  cp purple-config.cmake "${srcdir}/${pkgname}-${pkgver}/submodules/purple-cmake"
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -G "Unix Makefiles" ..
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install/strip
}
