# Maintainer: Kyle Fuller <kyle@fuller.li>

pkgname=drafter
pkgver=4.0.0
pkgrel=1
pkgdesc='API Blueprint Parser'
arch=('x86_64' 'i686')
url='https://github.com/apiaryio/drafter'
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/apiaryio/drafter/releases/download/v$pkgver/drafter-$pkgver.tar.gz")
sha256sums=('f284cddf24c321947f85c21e5b27500e876f0181d91eda7d96b3350b48533139')

prepare() {
  mkdir -p "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr "${srcdir}/drafter-${pkgver}"
  make drafter drafter-cli
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/drafter-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
