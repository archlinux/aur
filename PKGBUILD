# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contributor: Hermann Höhne <hoehermann@gmx.de>

pkgname=purple-gowhatsapp
pkgver=1.13.0
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for WhatsApp Web, Powered by go-whatsapp"
arch=('x86_64' 'i686')
url="https://github.com/hoehermann/purple-gowhatsapp"
license=('GPLv3')
depends=('libpurple')
makedepends=('go' 'cmake' )
optdepends=("gdk-pixbuf2: Pictures", "libopusfile: Sound")
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hoehermann/purple-gowhatsapp/archive/refs/tags/v${pkgver}.tar.gz" "purple-config.cmake")
noextract=()
sha256sums=('153229acd476ff1f98497074402944869c73e85ad06d6cfa8529bf4861960c96'
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
