# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Ginkgo <ginquo@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=pink-pony
pkgver=1.4.1
pkgrel=2
pkgdesc="Tron-like multiplayer racing game"
arch=(i686 x86_64)
url="https://github.com/ginkgo/pink-pony"
license=('GPL3')
depends=('glfw2' 'devil' 'protobuf' 'ftgl' 'libsigc++2.0' 'sdl_mixer')
makedepends=('scons' 'pkgconfig')
source=(https://github.com/ginkgo/pink-pony/archive/${pkgver}.tar.gz pink-pony pony.options)
md5sums=('9d19c777b1effe95818813290932e157'
         '2fa28298a4386efb521fe6369429efbd'
         '3e928844dfccaf0d7047b1ba2193f284')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's/env = Environment()/env=Environment(CXXFLAGS="-std=c++11")/' SConstruct

  scons
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
    
  mkdir -p "${pkgdir}/usr/share/${pkgname}" "${pkgdir}/usr/bin"

  cp -R README resources ${pkgdir}/usr/share/${pkgname}
  install -D -m 755 Pony ${pkgdir}/usr/share/${pkgname}/Pony
  install -D -m 644 ${srcdir}/pony.options ${pkgdir}/usr/share/${pkgname}
  install -D -m 755 ${srcdir}/pink-pony ${pkgdir}/usr/bin/pink-pony
  install -D -m 644 install/pink-pony.png ${pkgdir}/usr/share/pixmaps/pink-pony.png
  install -D -m 644 install/pink-pony.desktop ${pkgdir}/usr/share/applications/pink-pony.desktop
}

# vim:set ts=2 sw=2 et:
