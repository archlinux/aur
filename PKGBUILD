# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=hypr-git
pkgver=0.0.r328.fac4928
pkgrel=1
pkgdesc="Hypr is a Linux tiling window manager for Xorg. It's written in XCB with modern C++ and aims to provide easily readable and expandable code."
arch=('x86_64')
url="https://github.com/vaxerski/Hypr"
license=('BSD')
makedepends=('git')
depends=('cairo' 'gdb' 'ninja' 'gcc' 'cmake' 'libxcb' 'xcb-proto' 'xcb-util' 'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm' 'gtkmm' 'gtk4' 'gtkmm3')
source=("$pkgname::git+https://github.com/vaxerski/Hypr")
sha256sums=('SKIP')
options=(!makeflags !buildflags)

pkgver() {
    cd $pkgname
    printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$pkgname

    make clear && make release
}

package() {
    cd $srcdir/$pkgname

    mkdir -p "${pkgdir}/usr/bin/"
    install -D "build/Hypr" "${pkgdir}/usr/bin"

    mkdir -p "${pkgdir}/usr/share/xsessions"
    install -Dm644 "example/hypr.desktop" "${pkgdir}/usr/share/xsessions" 
}

