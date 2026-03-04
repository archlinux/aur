# Maintainer Nihmar at https://github.com/Nihmar/grunner

pkgname=grunner-git
pkgver=r1.abcdef1
pkgrel=1
pkgdesc="A fast, keyboard-driven application launcher for GNOME (git)"
arch=('x86_64')
url="https://github.com/Nihmar/grunner"
license=('MIT')
depends=('gtk4')
makedepends=('rust' 'cargo' 'git')
provides=('grunner')
conflicts=('grunner')
source=("$pkgname::git+https://github.com/Nihmar/grunner.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    RUSTFLAGS="-C target-cpu=native" cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/grunner"          "$pkgdir/usr/bin/grunner"
    install -Dm644 "assets/org.nihmar.grunner.svg"              "$pkgdir/usr/share/icons/hicolor/scalable/apps/grunner.svg"
    install -Dm644 "assets/org.nihmar.grunner.desktop"          "$pkgdir/usr/share/applications/grunner.desktop"
}
