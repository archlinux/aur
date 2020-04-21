# Maintainer: Kyle Fuller <kyle@fuller.li>

pkgname=drafter
pkgver=5.0.0
pkgrel=1
pkgdesc='API Blueprint Parser'
arch=('x86_64' 'i686')
url='https://github.com/apiaryio/drafter'
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/apiaryio/drafter/releases/download/v$pkgver/drafter-$pkgver.tar.gz")
sha256sums=('a35894a8f4de8b9ead216056b6a77c8c03a4156b6a6e7eae46d9e11d116a748e')

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
