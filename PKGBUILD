# Maintainer: Kyle Fuller <kyle@fuller.li>

pkgname=drafter
pkgver=4.0.1
pkgrel=1
pkgdesc='API Blueprint Parser'
arch=('x86_64' 'i686')
url='https://github.com/apiaryio/drafter'
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("https://github.com/apiaryio/drafter/releases/download/v$pkgver/drafter-$pkgver.tar.gz")
sha256sums=('cd166b86c04552be922f9276f77337f36f0d079b0d9b16fdd7ea776448846be6')

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
