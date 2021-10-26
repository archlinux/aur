# Maintainer: Asa Venton <asav1410 at gmail dot com>
# Contributor: onny <onny@project-insanity.org>
# Contributor: Jakob Nixdorf <flocke@shadowice.org>
# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>

pkgname=pidgin-opensteamworks
pkgver=1.7.1
pkgrel=1
pkgdesc="A plugin to connect to Steam Friends/Steam IM for libpurple/Pidgin/Adium."
url="https://github.com/EionRobb/${pkgname}"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('nss' 'libgnome-keyring')
depends=('libpurple' 'json-glib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EionRobb/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('6a154872985625980bd2dd7ce7c3f62f5adc28bc61ae2a44b9b789eebb69a58831c108667ce82de1a95f65a6043bdcdfda22e5fa6a71fc8e736271736bf0e48e')

build() {
  cd "${pkgname}-${pkgver}/steam-mobile"
  make
}

package() {
  cd "${pkgname}-${pkgver}/steam-mobile"
  #installing purple plugin
  install -Dm755 libsteam.so "${pkgdir}/usr/lib/purple-2/libsteam.so"
  #installing icons
  mkdir -p "${pkgdir}/usr/share/pixmaps/pidgin/protocols"
  for size in 16 22 48; do
    install -D steam${size}.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/${size}/steam.png"
  done
}
