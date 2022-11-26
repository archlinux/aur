# Maintainer: fenuks

pkgname=bstone
pkgver=1.2.12
pkgrel=2
pkgdesc="Unofficial source port for Blake Stone series (Aliens Of Gold and Planet Strike)."
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/bibendovsky/bstone"
license=('GPL2')
depends=("sdl2")
makedepends=('cmake')
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
install="$pkgname.install"
source=("$pkgname::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d5c4075d8f7b4866541006bff8c7b79ffc1f4fb543544616f57a44dec7f4a7da')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build && cd build
  cmake -B. -H.. \
    -DCMAKE_INSTALL_PREFIX='/usr/bin' \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo'
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -dm655 "${pkgdir}/usr/share/doc/${pkgname}"
  rm -f "${pkgdir}"/usr/bin/*license.txt
  mv "${pkgdir}"/usr/bin/*.txt "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
