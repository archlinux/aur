# Maintainer: Kyle Fuller <kyle@fuller.li>

pkgname=drafter
pkgver=4.1.0
pkgrel=1
pkgdesc='API Blueprint Parser'
arch=('x86_64' 'i686')
url='https://github.com/apiaryio/drafter'
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/apiaryio/drafter/releases/download/v$pkgver/drafter-$pkgver.tar.gz")
sha256sums=('243032f9ff202bffdc10b382a435f59b0110be8da1029f8c4208b8c22bd37f06')

prepare() {
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/drafter-${pkgver}"
  make drafter
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/drafter-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
