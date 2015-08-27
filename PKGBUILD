# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>
# Contributor: Jakob Nixdorf <flocke@shadowice.org>
# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>

pkgname=pidgin-opensteamworks
pkgver=1.6.1
pkgrel=1
pkgdesc="A plugin to connect to Steam Friends/Steam IM (purple plugin). "
url=("https://github.com/EionRobb/${pkgname}")
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('nss' 'libgnome-keyring')
depends=('libpurple' 'json-glib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EionRobb/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9f025538460dda01d769501326cf7ac597e069bdef3437eea89f392bede7e620e854a8c0b0659315a0834c8f2f60a38680f1f1bdccdb65d3b13f64f7981ee55b')

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
