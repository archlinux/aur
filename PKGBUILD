# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-git
pkgver=0.1.0.r9.g5751f1c
pkgrel=1
pkgdesc="sched_ext schedulers and tools"
arch=(x86_64)
url="https://github.com/sched-ext/scx"
license=("GPL2")
depends=('libbpf' 'bpf' 'libelf' 'zlib')
makedepends=('git' 'python' 'meson' 'clang' 'llvm-libs' 'cargo' 'rust')
source=("scx::git+https://github.com/sched-ext/scx")
sha256sums=('SKIP')
options=(!lto)
_reponame="scx"

pkgver() {
    cd "$_reponame"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_reponame
	meson setup build -Dbuildtype=release
	cd build
	meson compile -v
}


package() {
	cd $_reponame/build
	DESTDIR="$pkgdir" meson install
}
