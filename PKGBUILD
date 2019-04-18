# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=kore
pkgver=3.2.2
pkgrel=1
pkgdesc="An easy to use web platform for writing scalable web APIs in C."
arch=('i686' 'x86_64')
url="https://kore.io/"
license=('ISC')
depends=('openssl' 'postgresql-libs' 'python>=3.6')
provides=('kore')
source=("https://kore.io/releases/kore-${pkgver}.tar.gz")
sha256sums=('b10c3739487427419a760ae97ca688ccf47e68cf7e1f401c2076f0c56b2a6b34')

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
