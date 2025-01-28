# Maintainer: LS-Shandong <ls-shandong@outlook.com>

pkgname=guile-dbi
pkgver=2.1.9
pkgrel=2
pkgdesc='A simple, generic, easy-to-use guile scheme interface to SQL databases, such as Postgres, MySQL or SQLite3'
arch=('x86_64' 'aarch64')
url='https://github.com/opencog/guile-dbi'
license=('GPL2')
depends=('guile' 'texinfo')
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('25C38FE7E7176B4340951093FCBD13A9E6532D76399310CB6DF19E169EC19347')
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
