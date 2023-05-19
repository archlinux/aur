# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko-git
pkgver=0.11.0.r1.g72160419
pkgrel=1
pkgdesc="A language for building concurrent software with confidence "
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64)
depends=('llvm>=15.0.0' 'llvm<=16.0.0' git base-devel)
makedepends=('rust>=1.63' make)
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
