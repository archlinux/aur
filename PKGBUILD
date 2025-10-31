# Maintainer: Tony, btw <tony@tonybtw.com>
pkgname='oxwm-git'
_pkgname='oxwm'
pkgver=0.4.0.178.g334f1e8
pkgrel=1
arch=('x86_64')
url="https://github.com/tonybanters/oxwm"
pkgdesc="X11 Window Manager Inspired by DWM, but with better sane defaults."
license=('GPL-3.0-or-later')
depends=('libx11' 'libxft' 'libxcb' 'fontconfig' 'freetype2' 'libxrender')
makedepends=('cargo' 'git')
provides=('oxwm')
conflicts=('oxwm')
source=("$_pkgname::git+https://github.com/tonybanters/oxwm.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    cargo build --release --locked
}

check() {
    cd $_pkgname
    cargo test --release
}

package() {
    cd $_pkgname
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 oxwm.desktop "$pkgdir/usr/share/xsessions/oxwm.desktop"
}
