# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Sandro Kalbermatter <info dot kalsan [ät-symbol] valaiscom dot ch>
# Formerly (until 2017-09-30): Jon Gjengset <jon at thesquareplanet dot com>

pkgname=memtier_benchmark
pkgver=2.0.0
pkgrel=1
pkgdesc="Redis and Memcached traffic generation and benchmarking tool"
arch=('x86_64')
url="https://github.com/RedisLabs/memtier_benchmark"
license=('GPL2')
depends=('zlib' 'libmemcached' 'bash-completion')
makedepends=('pcre' 'libevent')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/RedisLabs/memtier_benchmark/archive/${pkgver}.tar.gz")
sha256sums=('92012becfcf3f82ce73e36ec3bc50132318a187efb6d42a31bfba8d6e3c5f6f9')

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
