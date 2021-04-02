# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=kore
pkgver=4.1.0
pkgrel=1
pkgdesc="An easy to use web platform for writing scalable web APIs in C."
arch=('i686' 'x86_64')
url="https://kore.io/"
license=('ISC')
depends=('curl' 'openssl' 'postgresql-libs')
provides=('kore')
source=("https://kore.io/releases/kore-${pkgver}.tar.gz")
sha256sums=('b7d73b005fde0ea01c356a54e4bbd8a209a4dff9cf315802a127ce7267efbe61')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # XXX Error while compiling Python support aside of cURL suppport. Disable Python support.
  PREFIX=/usr ACME=1 CURL=1 TASKS=1 PGSQL=1 JSONRPC=1 make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr" install

  install -dm755 "${pkgdir}/usr/share/doc/kore/"
  install -m644 conf/kore.conf.example "${pkgdir}/usr/share/doc/kore/"
  install -m644 README.md "${pkgdir}/usr/share/doc/kore/"
  cp -r examples "${pkgdir}/usr/share/doc/kore/examples/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
