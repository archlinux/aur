# Maintainer: Chris Foster <cdbfoster@gmail.com>
# Contributor: Josip Ponjavic

pkgname=glass-wm-git
pkgver=0.2.r0.g4c4e31f
pkgrel=1
pkgdesc="A small, extensible, window manager."
arch=('i686' 'x86_64')
url="https://github.com/cdbfoster/glass"
license=('GPL3')
depends=('pango'
         'xcb-util'
         'xcb-util-cursor'
         'xcb-util-keysyms'
         'xcb-util-wm')
makedepends=('cmake'
             'git'
             'pkg-config')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=("${pkgname%-*}::git+$url.git" 'glass-wm.desktop')
md5sums=('SKIP' 'a2c7c82c3a2348aabfc7321bbd4b08e8')

pkgver() {
    cd "${pkgname%-*}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    mkdir -p build
}

build() {
    cd build

    cmake -DCMAKE_BUILD_TYPE=Release "../${pkgname%-*}"
    make
}

package() {
    install -Dm755 "$srcdir/build/glass-wm" "$pkgdir/usr/bin/glass-wm"
    install -Dm644 "$srcdir/${pkgname%-*}.desktop" \
        "$pkgdir/usr/share/xsessions/${pkgname%-*}.desktop"
}
