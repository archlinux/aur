# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>
# Contributor: Jakob Nixdorf <flocke@shadowice.org>
# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>

pkgname=pidgin-opensteamworks
pkgver=1.7
pkgrel=1
pkgdesc="A plugin to connect to Steam Friends/Steam IM (purple plugin). "
url="https://github.com/EionRobb/${pkgname}"
arch=('i686' 'x86_64')
license=('GPL3')
makedepends=('nss' 'libgnome-keyring')
depends=('libpurple' 'json-glib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EionRobb/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('6369d8fb49fca3c8ad760d379c413da0be8bf58cbfdc5a4bb41ea6d803493110da8b0e1e3743c81b5068799b3a0ba6f57a90ba6208a5b112eb58434d134b1ba6')

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
