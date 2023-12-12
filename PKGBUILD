# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=scx-scheds-git
pkgver=0.1.1.r27.gfbb0164
pkgrel=1
pkgdesc="sched_ext schedulers"
arch=(x86_64)
url="https://github.com/sched-ext/scx"
license=("GPL2")
depends=('libbpf' 'bpf' 'libelf' 'zlib')
makedepends=('git' 'python' 'meson' 'clang' 'llvm-libs' 'cargo' 'rust')
source=("scx::git+https://github.com/sched-ext/scx")
sha256sums=('SKIP')
options=(!lto)
_reponame="scx"
provides=("scx-scheds=$pkgver")
conflicts=("scx-scheds")

pkgver() {
    cd "$_reponame"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_reponame"
    arch-meson . build
    meson compile -C build
}


package() {
    cd "$_reponame"
    meson install -C build --destdir "${pkgdir}"
}
