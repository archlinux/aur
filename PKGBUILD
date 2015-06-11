# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=glass-wm-git
pkgver=r249.58dce10
pkgrel=1
pkgdesc="Glass is a small, extensible, window manager."
arch=('x86_64' 'i686')
url="https://github.com/cdbfoster/glass"
license=('GPL3')
depends=('xcb-util-wm' 'pango' 'xcb-util-keysyms' 'xcb-util')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=("${pkgname%-*}::git+$url.git" 'glass-wm.desktop')
md5sums=('SKIP' 'a2c7c82c3a2348aabfc7321bbd4b08e8')

pkgver() {
    cd "${pkgname%-*}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd "build"

    cmake ../${pkgname%-*}
    make
}

package() {
    install -Dm755 "$srcdir/build/glass" "$pkgdir/usr/bin/glass-wm"
    install -Dm644 "$srcdir/${pkgname%-*}.desktop" \
        "$pkgdir/usr/share/xsessions/${pkgname%-*}.desktop"
}
