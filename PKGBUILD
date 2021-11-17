# Maintainer shenlebantongying <shenlebantongying@gmail.com>

_pkgname=ChezScheme
pkgname=chez-scheme-racket-git
pkgver=9.5
pkgrel=1
pkgdesc="Racket's fork of chez scheme with support for aach64."
url="https://github.com/racket/ChezScheme"
license=('Apache')

provides=(chez-scheme)
conflicts=(petite-chez-scheme)
replaces=(petite-chez-scheme)

arch=('i686'
      'x86_64'
      'armv6h'
      'aarch64')

source=()

md5sums=(
)

pkgver() {
    cd "$_pkgname"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

depends=('ncurses')
makedepends=('git' 'libx11' 'xorgproto')

prepare() {
    git clone --depth=1 https://github.com/racket/ChezScheme.git
    cd "$_pkgname"
    git submodule init
    git submodule update
}

build() {
    cd "$_pkgname"
    ./configure --pb --installprefix=/usr \
                     --installschemename=chez \
                     --installscriptname=chez-script \
                     --temproot="$pkgdir" \
                     --threads
    make
}

package() {
      make -C "$_pkgname" DESTDIR="$pkgdir"/ install
}
