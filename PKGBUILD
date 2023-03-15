# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>

pkgname=inko-git
pkgver=0.10.0.r2.gcfc2dce6
pkgrel=1
pkgdesc="A language for building concurrent software with confidence"
url="https://inko-lang.org"
license=(MPL2)
arch=(x86_64)
depends=('libffi>=3.2.0')
makedepends=('rust>=1.62' make)
provides=(inko)
conflicts=(inko inko-bin)
options=(strip !docs !libtool !staticlibs)
source=('inko::git+https://github.com/inko-lang/inko.git')
sha256sums=('SKIP')

pkgver() {
    cd inko
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd inko

    # Enable the libffi-system feature so the system libffy is used, instead of
    # compiling it from source.
    make build FEATURES='libffi-system' PREFIX='/usr'
}

package() {
    cd inko
    make install DESTDIR="${pkgdir}" PREFIX='/usr'
}
