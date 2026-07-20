# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Letu Ren <fantasquex@gmail.com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=uftrace
pkgver=0.19
pkgrel=1
pkgdesc="Function graph tracer for C/C++/Rust"

url="https://github.com/namhyung/uftrace"

arch=('x86_64')
license=('GPL-2.0-only')

makedepends=(
  'pkgconf'
  'pandoc'
  'make'
)
depends=(
  'glibc'
  'libelf'
  'python'
  'ncurses'
  'luajit'
  'capstone'
  'libunwind'
  'libstdc++'
  'libtraceevent'
)
depends=(libtraceevent capstone uftrace python glibc libelf ncurses libstdc++)
# Disable LTO due to upstream issue
# https://github.com/namhyung/uftrace/issues/1343
options=('!lto')

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/namhyung/uftrace/archive/v${pkgver}.tar.gz")
sha256sums=('c35ef25f279684fc7d79dcc250fb29386890870fd2c9f812e587151419ca01af')

build() {
	cd "${pkgname}-${pkgver}/"

	./configure --prefix=/usr

	make
}

check() {
	cd "${pkgname}-${pkgver}/"

	# make test

	make unittest
	# make runtest
	# make pytest
}

package() {
	cd "${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}" install

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
