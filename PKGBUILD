# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Sandro Kalbermatter <info dot kalsan [ät-symbol] valaiscom dot ch>
# Formerly (until 2017-09-30): Jon Gjengset <jon at thesquareplanet dot com>

pkgname=memtier_benchmark
pkgver=2.1.3
pkgrel=1
pkgdesc="Redis and Memcached traffic generation and benchmarking tool"
arch=('x86_64')
url="https://github.com/RedisLabs/memtier_benchmark"
license=('GPL2')
depends=('zlib' 'libmemcached' 'bash-completion')
makedepends=('pcre' 'libevent')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/RedisLabs/memtier_benchmark/archive/${pkgver}.tar.gz")
sha256sums=('cc5ff220ae02b68dfc15357c2345a11d2666f56c7f948923cd4e3f498299e44c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
