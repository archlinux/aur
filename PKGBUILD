# Maintainer: GhostNaN <GhostNaN@protonmail.com>
_gitname=mpvpaper
pkgname="$_gitname-git"
pkgver=r136.131a52c
pkgrel=1
pkgdesc="A video wallpaper program for wlroots based wayland compositors."
arch=('i686' 'x86_64')
url="https://github.com/GhostNaN/$_gitname"
license=('GPL3')
depends=('libmpv.so' 'libwayland-client.so' 'libwayland-egl.so')
makedepends=('git' 'meson' 'ninja' 'wayland-protocols')
optdepends=('socat: control via sockets')
provides=('mpvpaper')
source=("${pkgname}::git+https://github.com/GhostNaN/$_gitname.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    arch-meson "$pkgname" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -D -m644 "$pkgname/mpvpaper.man" "$pkgdir/usr/share/man/man1/mpvpaper.1"
}
