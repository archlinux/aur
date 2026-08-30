# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Letu Ren <fantasquex@gmail.com>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

pkgname=uftrace
pkgver=0.20
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
  'libstdc++'
  'xz'
  'python'
  'ncurses'
  'capstone'
  'libelf'
  'libunwind'
  'libtraceevent'
)

# Disable LTO due to upstream issue
# https://github.com/namhyung/uftrace/issues/1343
options=('!lto' '!strip')

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/namhyung/uftrace/archive/v${pkgver}.tar.gz")
sha256sums=('03189061130693b274a4d0af47c4a3135d4a496ca111b78233593bfcb3d3720f')

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
