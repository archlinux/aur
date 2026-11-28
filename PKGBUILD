# Maintainer: Fabian Brosda <fabi3141@gmx.de>
# Maintainer: LS-Shandong <ls-shandong@outlook.com>

pkgname=guile-dbi
pkgver=3.3.0
pkgrel=1
pkgdesc='A simple, generic, easy-to-use guile scheme interface to SQL databases, such as Postgres, MySQL or SQLite3'
arch=('x86_64' 'aarch64')
url='https://github.com/opencog/guile-dbi'
license=('GPL-2.0-only')
depends=('guile' 'texinfo')
makedepends=('libtool')
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('af92ca21240eda178da8528ba8b77dd2245813d1bef524d6015b5f6519df800b')
options=(!strip)

build () {
  cd "${srcdir}/$pkgname-$pkgname-$pkgver/${pkgname}"
  ./autogen.sh --no-configure
  ./configure --prefix=/usr
  make
  cd doc
  make
}

package () {
  cd "${srcdir}/$pkgname-$pkgname-$pkgver/${pkgname}"
  make DESTDIR=$pkgdir install
  cd doc
  gzip guile-dbi.info
  install -Dm644 "${srcdir}/$pkgname-$pkgname-$pkgver/${pkgname}/doc/guile-dbi.info.gz" "${pkgdir}/usr/share/info/guile-dbi.info.gz"
}
