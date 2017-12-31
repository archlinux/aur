# Maintainer: Tucker Boniface <tucker@boniface.tech>
# Maintainer: lilydjwg <lilydjwg@gmail.com>
# Contributor: Jakub Wilk <jwilk@jwilk.net>
VCS="git"
pkgname="fbcat-git"
pkgver=r198.5ed41b4
pkgrel=1
pkgdesc="A framebuffer screenshot grabber (development version)"
arch=(i686 x86_64)
url="https://github.com/jwilk/fbcat"
license=("GPLv2")
makedepends=("${VCS}" "docbook-xsl")
provides=("fbcat" "fbgrab")
conflicts=("fbcat" "fbgrab")
source=("git+https://github.com/jwilk/fbcat")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/${pkgname%-${VCS}}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    patch fbcat/doc/Makefile ../doc.patch
    cd "$srcdir/${pkgname%-${VCS}}"
    make
    make -C doc
}

package() {
    cd "$srcdir/${pkgname%-${VCS}}"
    mkdir -p "$pkgdir/usr/share/man/man1"
    make DESTDIR="$pkgdir/" install
    make DESTDIR="$pkgdir/" -C doc install
}
