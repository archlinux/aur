# Maintainer: Rene Hickersberger <r@renehsz.com>
_pkgbase='9pro'
pkgname="$_pkgbase-git"
pkgver=r111.2c1651b
pkgrel=1
pkgdesc='Plan9-related tools for Unix-like operating systems'
url='https://git.sr.ht/~ft/9pro'
license=('public domain')
arch=('x86_64')
depends=()
makedepends=()
provides=('9pro')
conflicts=('9pro')

source=("$_pkgbase::git+https://git.sr.ht/~ft/9pro")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgbase"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgbase"
    CFLAGS="-Os -s -g0" make
}

package() {
	cd "$srcdir/$_pkgbase"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

