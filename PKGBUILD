# Maintainer: Kyle Fuller <kyle@fuller.li>

pkgname=drafter
pkgver=4.0.2
pkgrel=1
pkgdesc='API Blueprint Parser'
arch=('x86_64' 'i686')
url='https://github.com/apiaryio/drafter'
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/apiaryio/drafter/releases/download/v$pkgver/drafter-$pkgver.tar.gz")
sha256sums=('35e9ca58acbf7dc2e8c48a8bf16bc7a4efbdc2dedaeedb258e0ad80c14496d78')

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
