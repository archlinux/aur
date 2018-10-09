# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=kore
pkgver=3.1.0
pkgrel=1
pkgdesc="An easy to use web platform for writing scalable web APIs in C."
arch=('i686' 'x86_64')
url="https://kore.io/"
license=('ISC')
depends=('openssl' 'postgresql-libs' 'python>=3.6')
provides=('kore')
source=("https://kore.io/releases/kore-${pkgver}.tar.gz")
sha256sums=('3f78fb03262046ffa036a7e112dbcbc45fbfca509a949b42f87a55da409f6595')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  PREFIX=/usr TASKS=1 PGSQL=1 JSONRPC=1 PYTHON=1 make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr" install

  install -dm755 "${pkgdir}/usr/share/doc/kore/"
  install -m644 conf/kore.conf.example "${pkgdir}/usr/share/doc/kore/"
  install -m644 README.md "${pkgdir}/usr/share/doc/kore/"
  cp -r examples "${pkgdir}/usr/share/doc/kore/examples/"
}
