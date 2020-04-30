# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Sandro Kalbermatter <info.kalsan [ät-symbol] valaiscom.ch>
# Formerly (until 2017-09-30): Jon Gjengset <jon@thesquareplanet.com>

pkgname=memtier_benchmark
pkgver=1.3.0
pkgrel=1
pkgdesc="Redis and Memcached traffic generation and benchmarking tool"
arch=('x86_64')
url="https://github.com/RedisLabs/memtier_benchmark"
license=('GPL2')
depends=('zlib' 'libmemcached' 'bash-completion')
makedepends=('pcre' 'libevent')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/RedisLabs/memtier_benchmark/archive/${pkgver}.tar.gz")
sha256sums=('eac1ab8714bb9491a63d8f106d11a36204ad8fc9ec6abb85abac152f566066c6')

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
