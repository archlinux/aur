# Maintainer: Tony, btw <tony@tonybtw.com>
pkgname='oxwm-git'
_pkgname='oxwm'
pkgver=0.12.0.0.gdd25e8c
pkgrel=1
arch=('x86_64')
url="https://github.com/tonybanters/oxwm"
pkgdesc="X11 Window Manager Inspired by DWM, but with better sane defaults."
license=('GPL-3.0-or-later')
depends=('freetype2' 'libx11' 'libxft' 'libxinerama' 'fontconfig' 'lua')
makedepends=('zig' 'git')
provides=('oxwm')
conflicts=('oxwm')
source=("$_pkgname::git+https://github.com/tonybanters/oxwm.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
    cd $_pkgname
    zig build -Doptimize=ReleaseSmall
}

check() {
    cd $_pkgname
    zig build test -Doptimize=ReleaseSmall
}

package() {
    cd $_pkgname
    install -Dm755 "zig-out/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 resources/oxwm.desktop "$pkgdir/usr/share/xsessions/oxwm.desktop"
    install -Dm644 resources/oxwm.1 "$pkgdir/usr/share/man/man1/oxwm.1"
    install -Dm644 templates/oxwm.lua "$pkgdir/usr/share/oxwm/oxwm.lua"
}
