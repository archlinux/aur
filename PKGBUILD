# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Sandro Kalbermatter <info.kalsan [ät-symbol] valaiscom.ch>
# Formerly (until 2017-09-30): Jon Gjengset <jon@thesquareplanet.com>

pkgname=memtier_benchmark
pkgver=1.2.17
pkgrel=1
pkgdesc="Redis and Memcached traffic generation and benchmarking tool"
arch=('x86_64')
url="https://github.com/RedisLabs/memtier_benchmark"
license=('GPL2')
depends=('zlib' 'libmemcached' 'bash-completion')
makedepends=('pcre' 'libevent')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/RedisLabs/memtier_benchmark/archive/${pkgver}.tar.gz")
sha256sums=('18526a32732173ac5f73cecfa003571079634e8d124132eaf545c46bab61e0b2')

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
