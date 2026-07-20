# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=moonstone
pkgver=0.3.19
pkgrel=1
pkgdesc='Modern, deterministic Lua project environments and package manager written in Zig'
arch=(x86_64 aarch64)
url="https://github.com/moonstone-sh/$pkgname"
license=(Apache-2.0)
depends=(glibc
         sqlite3
         zstd)
makedepends=(cmake
             zig)
_archive="$pkgname-$pkgver"
# _zigdeps=(https://github.com/sam701/zig-toml/archive/master.tar.gz)
source=("$url/archive/refs/tags/v$pkgver/$_archive.tar.gz")
sha256sums=('56a4445b1b83987c749bbdcc10ad3d917e354e1f0289c59e9a224f469a511cc3')

prepare() {
	cd "$_archive"
	# zig fetch --debug-hash --global-cache-dir "$_global_cache"
}

build() {
	cd "$_archive"
	local zig_options=(
		-Doptimize=ReleaseFast
		-Dtarget=native-linux.6.6-gnu.2.40
		-Dcpu=baseline
		--build-id=sha1
		--prefix /usr
		--search-prefix /usr
		--summary all
		--verbose
	)
	DESTDIR=build zig build ${zig_options[@]}
}

package() {
	cd "$_archive"
}
