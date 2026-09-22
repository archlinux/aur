# Maintainer: Adrià Arrufat <swiftscythe at gmail dot com>

pkgbase=castig
pkgname=(castig castigui)
pkgver=0.1.0
pkgrel=1
pkgdesc="Cast local or remote video to a Chromecast, with audio transcoding and subtitle support"
arch=(x86_64 aarch64)
url="https://github.com/arrufat/castig"
license=(MIT)
makedepends=(git anyzig ffmpeg sdl3)
# The tag from the repository rather than a generated tarball: what is built is
# what the history says, not what the forge packed.
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$pkgbase"
    zig build install gui --release=fast -fsys=ffmpeg -fsys=sdl3
}

check() {
    cd "$pkgbase"
    zig build test --release=fast -fsys=ffmpeg -fsys=sdl3
}

package_castig() {
    depends=(glibc ffmpeg)
    optdepends=('castigui: the window that `castig ui` opens')

    cd "$pkgbase"
    install -Dm755 zig-out/bin/castig "$pkgdir/usr/bin/castig"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_castigui() {
    pkgdesc="Cast local or remote video to a Chromecast, in a window"
    depends=(glibc ffmpeg sdl3)

    cd "$pkgbase"
    install -Dm755 zig-out/bin/castigui "$pkgdir/usr/bin/castigui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
