# Maintainer: Benjamin Chretien <chretien dot b at gmail dot com>
pkgname=hqp
pkgver=1.9.8
pkgrel=1
pkgdesc="A solver for sparse nonlinear optimization"
arch=('i686' 'x86_64')
url="http://omuses.github.io/hqp"
license=('LGPL2')
depends=()
optdepends=('tcl')
makedepends=('doxygen')
conflicts=('hqp-git')
source=("https://github.com/omuses/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('46a0fe3721ec1192279594c321e8d33a72e0ff5cf9a1c868aa199e8ea743d103')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
  make doc
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make --silent INSTALL_PREFIX="${pkgdir}/usr" install

  # Copy doc
  mkdir -p "$pkgdir/usr/share/doc/${pkgname}"
  cp -r "doc/html" "$pkgdir/usr/share/doc/${pkgname}"
}
