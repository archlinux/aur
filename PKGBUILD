# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: Chris Wong <https://wiki.archlinux.org/index.php/Special:EmailUser/Lambda_Fairy>

pkgname=xsettingsd-git
pkgver=r103.86ce25f
pkgrel=1
pkgdesc="Provides settings to X11 applications via the XSETTINGS specification"
arch=('i686' 'x86_64')
url="https://codeberg.org/derat/xsettingsd"
license=('BSD-3-Clause')
depends=('libx11' 'gcc-libs')
makedepends=('git' 'cmake')
provides=('xsettingsd')
conflicts=('xsettingsd')
source=("$pkgname::git+https://codeberg.org/derat/xsettingsd.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S $pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 $pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}

