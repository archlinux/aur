# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contributor: Hermann Höhne <hoehermann@gmx.de>

pkgname=purple-gowhatsapp
pkgver=1.0.0
pkgrel=1
pkgdesc="A libpurple/Pidgin plugin for WhatsApp Web, Powered by go-whatsapp"
arch=('x86_64' 'i686')
url="https://github.com/hoehermann/purple-gowhatsapp"
license=('GPLv3')
depends=('libpurple')
makedepends=('go')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hoehermann/purple-gowhatsapp/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('33c28ccc84d55ff6cf3974fbf344b9f6bc66251ca5a4547fd481d062a3386c0c')

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -G "Unix Makefiles" ..
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}/" install/strip
}
