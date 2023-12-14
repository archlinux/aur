# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko-git
pkgver=0.13.0.r0.g183e5633
pkgrel=1
pkgdesc="A language for building concurrent software with confidence"
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64 aarch64)
depends=(llvm15 git base-devel)
makedepends=(cargo make)
provides=(inko)
conflicts=(inko)
options=(strip !docs !libtool !staticlibs)
source=('inko::git+https://github.com/inko-lang/inko.git')
sha256sums=('SKIP')

pkgver() {
    cd inko
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd inko
    make build PREFIX='/usr'
}

package() {
    cd inko
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
