# Maintainer: Fabian Brosda <fabi3141@gmx.de>
# Maintainer: LS-Shandong <ls-shandong@outlook.com>

pkgname=guile-dbi
pkgver=3.1.1
pkgrel=1
pkgdesc='A simple, generic, easy-to-use guile scheme interface to SQL databases, such as Postgres, MySQL or SQLite3'
arch=('x86_64' 'aarch64')
url='https://github.com/opencog/guile-dbi'
license=('GPL-2.0-only')
depends=('guile' 'texinfo')
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('66bcb1544a8757d02b2b856694bc864646b99a52a4b65102b1d259ba47135ff5')
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
