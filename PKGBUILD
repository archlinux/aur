# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: György Balló
# Contributor: Eric BÃ©langer <eric@archlinux.org>

pkgname=xv
pkgver=3.10a
pkgrel=24
_jsrel=4.0.0-alpha7
pkgdesc="A nice image viewer"
arch=('i686' 'x86_64')
url="http://www.trilon.com/xv/"
license=('custom')
depends=('libpng' 'libx11' 'libtiff' 'jasper')
makedepends=('cmake' 'libxt')
options=('!emptydirs')
source=(https://github.com/jasper-software/xv/releases/download/v${_jsrel}/${pkgname}-${pkgver}-js-${_jsrel}.tar.gz
        license.txt)
sha1sums=('a8124cedcfe77a51d56df43e789366880b494627'
          '4561344e8f2c30eee9c55b14a14f062d89d6e7b7')

prepare() {
  cd "${pkgname}-${pkgver}-js-${_jsrel}"
  cmake -H. -Btmp_cmake \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DCMAKE_INSTALL_SYSCONFDIR="${pkgdir}/etc" \
    -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd "${pkgname}-${pkgver}-js-${_jsrel}"
  cmake --build tmp_cmake
}

package() {
  cd "${pkgname}-${pkgver}-js-${_jsrel}"
  cmake --build tmp_cmake --target install
  install -D -m644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

# installing source tarball (to comply with license)
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}-js-${_jsrel}.tar.gz" "${pkgdir}/usr/share/doc/xv/xv-${pkgver}-source.tar.gz"
  ln -s "/usr/share/licenses/${pkgname}/license.txt" "${pkgdir}/usr/share/doc/xv/license.txt"
}
