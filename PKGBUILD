# Maintainer: Craig Barnes <craigbarnes@protonmail.com>
pkgname=dte-git
pkgver=1.9.1+816+gdc59d61e
pkgrel=1
pkgdesc='A small, configurable console text editor'
url='https://craigbarnes.gitlab.io/dte/'
arch=(x86_64 i686 armv7h aarch64)
license=(GPL2)
depends=(glibc)
makedepends=(git bash-completion)
conflicts=(dte)
provides=(dte)
source=("git+https://gitlab.com/craigbarnes/dte.git")
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/dte"
    git describe --match='v[1-9]*' | tr - + | sed 's/^v//'
}

build() {
    cd "$srcdir/dte"
    make V=1
}

check() {
    cd "$srcdir/dte"
    make check V=1
}

package() {
    cd "$srcdir/dte"
    make install install-bash-completion V=1 prefix=/usr DESTDIR="$pkgdir"
}
