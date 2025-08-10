# Maintainer: Lyna Stral <testerthe60@gmail.com>

_pkgname=babylonia-terminal
pkgname="$_pkgname"-git
pkgver=e239c1a
pkgrel=1
pkgdesc="A launcher to play a certain anime game on linux"
arch=('x86_64')
url="https://github.com/ALEZ-DEV/Babylonia-terminal"
license=('GPL3')
depends=("gtk4" "libadwaita" "winetricks")
makedepends=("git" "cargo")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

options=('!lto')

pkgver() {
    cd "$srcdir"/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "$srcdir"/${_pkgname}
    cargo build --release --bin babylonia-terminal
}

package() {
	install -Dm644 "../babylonia-terminal.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/babylonia-terminal.png"
	install -Dm644 "../babylonia-terminal.desktop" "${pkgdir}/usr/share/applications/babylonia-terminal.desktop" 

    cd "$srcdir"/${_pkgname}
	install -Dm755 "target/release/babylonia-terminal" "${pkgdir}/usr/bin/babylonia-terminal"
}
