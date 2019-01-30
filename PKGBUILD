# Maintainer: Francois Menning <f.menning@pm.me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=wiredtiger
pkgver=3.1.0
pkgrel=1
pkgdesc="High performance, scalable, production quality, NoSQL, Open Source extensible platform for data management"
arch=('x86_64')
url="http://source.wiredtiger.com/"
license=('GPL')
depends=('lz4' 'python' 'snappy' 'zlib' 'zstd')
makedepends=('swig')
install=wiredtiger.install
source=("$pkgname.tar.gz::https://github.com/wiredtiger/wiredtiger/archive/$pkgver.tar.gz")
sha512sums=('f6a5baefc0306f6861ee3a8c4314f5564408798ae9b10e7d0b4542bab8105fcadec6b39091930c3d303f34562ce092b924bdc1be46599123873e749bcdd7e47e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
    --enable-crc32-hardware \
    --enable-leveldb \
    --enable-python \
    --enable-snappy \
    --enable-lz4 \
    --enable-tcmalloc \
    --enable-zlib \
    --enable-zstd \
    --with-python-prefix=${pkgdir}/usr/lib/python3.7/site-packages

  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
