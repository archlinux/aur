# Maintainer: sinomor
pkgname=libastal-niri-git
_pkgname=niri
pkgver=r874.ca95a0d
pkgrel=1
provides=(astal-niri libastal-niri libastal-niri.so=0-64)
pkgdesc="Library and cli tool for Niri IPC sockets"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/sameoldlab/astal"
depends=(
    glib2
    glibc
    json-glib
)
makedepends=(
    meson
    git
    gobject-introspection
    vala
)
groups=("libastal")
source=("git+${url}.git#branch=feat/niri")
sha256sums=('SKIP')

pkgver() {
    cd astal
    #git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd astal/lib/$_pkgname
    arch-meson build
    meson compile -C build
}

package() {
    cd astal/lib/$_pkgname
    meson install -C build --destdir "$pkgdir"
}

