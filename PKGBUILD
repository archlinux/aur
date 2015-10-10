# Maintainer : kuroclef / Kazumi M. <kuroclef@gmail.com>

pkgname=shinonome-git
pkgver=HEAD
pkgrel=1
pkgdesc='A Linux console-based BMS player using ncurses.'
arch=(i686 x86_64)
url='https://github.com/kuroclef/shinonome'
license=(GPL3)
depends=(ncurses sdl2 sdl2_mixer)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://github.com/kuroclef/shinonome.git')
md5sums=(SKIP)

pkgver() {
    cd "$srcdir"/"${pkgname%-git}"
    printf %s "$(git log -1 --format=%ci | sed 's/^\(\S*\).*/\1/;s/-/_/g')"
}

build() {
    cd "$srcdir"/"${pkgname%-git}"
    make
}

package() {
    cd "$srcdir"/"${pkgname%-git}"
    install -Dm 755 ./"${pkgname%-git}" "$pkgdir"/usr/bin/"${pkgname%-git}"
    install -Dm 644 ./README.md         "$pkgdir"/usr/share/doc/"${pkgname%-git}"/README.md
}
