
# Maintainer: Lorenzo Ferrillo <lorenzofer at live dot it>
# Contributor: sgar < swhaat at github >
_basename=libcapi
pkgname=lib32-libcapi
pkgver=3.2.3
pkgrel=1
pkgdesc="Modular libcapi20 (32 bit lib)"
arch=('x86_64')
url="https://www.tabos.org/"
license=('GPL2')
conflicts=(isdn4k-utils)
depends=(libcapi)
makedepends=(meson git)
options=('!emptydirs')

source=(
  "git+https://gitlab.com/tabos/${_basename}.git#tag=v${pkgver}"
)
sha512sums=(
  'SKIP'
)

build() {
  cd "${srcdir}/${_basename}"
  rm "./builddir" -Rf
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  meson --prefix /usr --libdir /usr/lib32 --buildtype=plain "builddir"
  ninja -v -C "builddir"
}

check() {
  cd "${srcdir}/${_basename}"
  ninja -C "builddir" test
}

package() {
  cd "${srcdir}/${_basename}"
  DESTDIR="$pkgdir" ninja -C "builddir" install
  rm -R ${pkgdir}/usr/include 

}
