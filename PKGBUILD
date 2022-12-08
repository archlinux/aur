# Maintainer: Ruben Bekaert <bekaertruben@gmail.com>

pkgname=pygplates

pkgdesc="PyGPlates enables access to GPlates functionality via the Python programming language."
url="https://www.gplates.org"
license=(GPLv2)

arch=(x86_64)
pkgver=0.36.0
pkgrel=1

depends=(gplates=2.3.0 python python-numpy)
makedepends=(cmake python-sphinx)

source=(
  "${pkgname}_${pkgver}_src.zip::https://www.earthbyte.org/download/9112"
  "${pkgname}.sh"
)
sha256sums=(
  "f18b34ea5f3f70c7df7b09190dc14cd0ff17eab084a116f45e629511fae95003"
  "38223b8e8aebdbb18e6705a864898a20f386951b852a748e5206179f369256c5"
)

build() {
  cd "${srcdir}/${pkgname}_${pkgver}_src"
  cmake .
  make
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}_src"
  make DESTDIR="${pkgdir}/" install
  install -Dm755 "${srcdir}/${pkgname}.sh" -t "${pkgdir}/etc/profile.d/"
}