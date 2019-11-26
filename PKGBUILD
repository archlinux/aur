# Mantainer: sgar < swhaat at github >

pkgname=libcapi
pkgver=3.2.0
pkgrel=1
pkgdesc="Modular libcapi20"
arch=('i686' 'x86_64')
url="https://www.tabos.org/"
license=('GPL2')

makedepends=(meson git)
options=('!emptydirs')

source=(
  "git+https://gitlab.com/tabos/${pkgname}.git#tag=v${pkgver}"
)
sha512sums=(
  'SKIP'
)

build() {
  cd "${srcdir}/${pkgname}"
  meson --prefix /usr --buildtype=plain "builddir"
  ninja -v -C "builddir"
}

check() {
  cd "${srcdir}/${pkgname}"
  ninja -C "builddir" test
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" ninja -C "builddir" install
}
