# Maintainer: Sandro Kalbermatter <info.kalsan [ät-symbol] valaiscom.ch>
# Formerly (until 2017-09-30): Jon Gjengset <jon@thesquareplanet.com>
pkgname=memtier_benchmark
pkgver=1.2.10
pkgrel=2
pkgdesc="NoSQL Redis and Memcache traffic generation and benchmarking tool."
arch=('any')
url="https://github.com/RedisLabs/memtier_benchmark"
license=('GPL2')
depends=('zlib' 'libmemcached')
makedepends=('git' 'pcre' 'libevent')
options=()
source=("git+https://github.com/RedisLabs/memtier_benchmark.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	ver=$(git describe --tags `git rev-list --tags --max-count=1`)
	git checkout "$ver"
	printf "%s" "$ver"
}

prepare() {
	cd "$srcdir/${pkgname}"
	autoreconf -ivf
}

build() {
	cd "$srcdir/${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
