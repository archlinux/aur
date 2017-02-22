# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=crazydiskinfo
pkgver=1.0.2
pkgrel=1
pkgdesc="An interactive TUI S.M.A.R.T viewer"
arch=('x86_64')
url='https://github.com/otakuto/crazydiskinfo'
license=(MIT)
depends=('libatasmart')
makedepends=('cmake')
source=("https://github.com/otakuto/crazydiskinfo/archive/${pkgver}.tar.gz")
sha256sums=('828165463a566b1736c5d94cfe8e0036085b99cefee65191fcba770156d9a2bd')

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}
