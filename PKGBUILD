# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>

pkgname=crap-clone-git
pkgver=r291.89513ab
pkgrel=2
pkgdesc="CVS to git repository converter supporting incremental conversions"
arch=(i686 x86_64)
depends=('zlib' 'libpipeline')
makedepends=('git')
license=('GPL3')
url="https://github.com/rcls/crap"
source=("git://github.com/rcls/crap"
        "fixrelpaths.patch")
md5sums=('SKIP'
         'ca41efa0d07cfab12eede196ac6ca0fb')

_gitroot="git://github.com/rcls/crap"
_gitname="crap"

pkgver() { 
    cd "$srcdir/$_gitname" 
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
    cd "$srcdir/$_gitname"
    patch -p1 < "$srcdir/fixrelpaths.patch" || true
    make
}

package() {
    mkdir -p "$pkgdir"/usr/{bin,man/man1}
    install -m 644 "$srcdir/$_gitname"/crap-clone.1 "$pkgdir"/usr/man/man1/
    install -m 755 "$srcdir/$_gitname"/crap-clone "$pkgdir"/usr/bin
}

