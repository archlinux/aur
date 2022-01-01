pkgname=mold-git
pkgver=v1.0.1_11_g4ccbd24c
pkgrel=1
pkgdesc="A Modern Linker"
arch=(x86_64)
url="https://github.com/rui314/mold"
license=("AGPL3")
depends=("gcc-libs" "mimalloc" "openssl" "tbb" "zlib")
makedepends=("clang" "xxhash")
source=("mold::git+https://github.com/rui314/mold")
sha256sums=("SKIP")
reponame="mold"
MKFLAGS=" PREFIX=/usr LTO=1 SYSTEM_MIMALLOC=1 SYSTEM_TBB=1 SYSTEM_XXHASH=1"

prepare() {
	cd "$reponame"
	sed -i "s/libexec/lib/" Makefile
}

pkgver() {
	cd "$reponame"
	git describe --long --tags | sed "s/-/_/g"
}

build() {
	make -C "${reponame}" PREFIX=/usr LTO=1 SYSTEM_MIMALLOC=1 SYSTEM_TBB=1 SYSTEM_XXHASH=1 -j `nproc`
}

package() {
	make -C "${reponame}" PREFIX=/usr LTO=1 SYSTEM_MIMALLOC=1 SYSTEM_TBB=1 SYSTEM_XXHASH=1 DESTDIR="${pkgdir}" install
}
