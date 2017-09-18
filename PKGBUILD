# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=rewritefs-git
_gitname=rewritefs
pkgver=r26.33fb844
pkgrel=1
pkgdesc="A FUSE filesystem intended to be used like Apache mod_rewrite"
arch=(i686 x86_64)
url=https://github.com/sloonz/rewritefs
license=(GPL)
depends=(fuse pcre)
makedepends=(git)
source=(git+https://github.com/sloonz/rewritefs.git)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/rewritefs"
    printf "r%s.%s"                     \
        "$(git rev-list --count HEAD)"  \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitname"
    make
}

package() {
    cd "$srcdir/$_gitname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
