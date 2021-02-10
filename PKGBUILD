# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

pkgname=wlrctl-git
pkgver=r24.1bce5aa
pkgrel=1
pkgdesc='Utility for miscellaneous wlroots extensions'
url='https://git.sr.ht/~brocellous/wlrctl'
arch=('x86_64')
license=('MIT')
depends=('wayland' 'libxkbcommon')
provides=('wlrctl')
makedepends=('scdoc' 'meson' 'ninja')
source=("${pkgname}::git+https://git.sr.ht/~brocellous/wlrctl")
sha1sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
}

build() {
    cd "${srcdir}/${pkgname}"
    rm -rf "${srcdir}/build"
    meson -Dwerror=false --prefix /usr "$srcdir/build"
    ninja -C "$srcdir/build"
}

package() {
    DESTDIR="$pkgdir" ninja -C "${srcdir}/build" install
}
