# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano dot torromeo at gmail dot com>
# Contributor: Peter Nguyen <peter dot hieu dot nguyen at gmail dot com>

pkgname=mongrel2
pkgver=1.12.2
pkgrel=2
pkgdesc="Application, language, and network architecture agnostic web server"
url="https://mongrel2.org/"
license=('BSD')
arch=("i686" "x86_64")
depends=('sqlite3' 'zeromq')
makedepends=('git')
source=("https://github.com/mongrel2/mongrel2/releases/download/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=('3bffeae198c37a1efc9c12f77d5f1eb61cdf62b35d661babc2527dd030aa7d8f')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  OPTFLAGS="$CFLAGS -Wno-implicit-fallthrough -Wno-unused -Wno-unused-result $LDFLAGS" make -f localmbedtls.mak
}

check() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make -f localmbedtls.mak tests
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make -f localmbedtls.mak PREFIX="${pkgdir}"/usr install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
