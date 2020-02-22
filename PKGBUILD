# Maintainer: Kyle Laker <kyle@laker.email>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=lm-warp-git
pkgver=r39.53989e7
pkgrel=1
pkgdesc="Share files across the LAN by Linux Mint"
arch=("x86_64")
url="https://github.com/linuxmint/warp"
# License file is missing from the root of the repository; however, GPL-2+ is given in the
# debian/control file: https://github.com/linuxmint/warp/blob/master/debian/copyright
license=("GPL")
depends=("pygobject-devel" "python-setproctitle" "python-zeroconf" "python-xapp" "xapps")
makedepends=("git" "meson")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/warp"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    meson --prefix /usr --buildtype=plain warp build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
