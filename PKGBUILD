# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>
pkgname=sail-riscv
pkgver=0.7
pkgrel=2
pkgdesc="Sail RISC-V model"
arch=(x86_64)
url="https://github.com/riscv/sail-riscv"
license=('BSD')
depends=(gmp)
makedepends=(sail-isa-spec)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4f11b4f93e4d6c37246cd3e56c30578ec67266b031a429ee91f28c458271e149')

build() {
	local cmake_options=(
		-B build
		-S $pkgname-$pkgver
		-DCMAKE_BUILD_TYPE=Release
		-DDOWNLOAD_GMP=FALSE
		-DCMAKE_INSTALL_PREFIX=/usr 
		-DCMAKE_INSTALL_LIBDIR=lib
	)
	cmake "${cmake_options[@]}"
	cmake --build build	
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	cd $pkgdir/usr/bin
	ln -s riscv_sim_rv32d riscv_sim_RV32
	ln -s riscv_sim_rv64d riscv_sim_RV64
}
