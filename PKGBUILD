# Maintainer: Ariel AxionL <axionl@aosc.io>
pkgname=gcsf-git
pkgver=r161.cc3f079
pkgrel=4
pkgdesc="a FUSE file system based on Google Drive (Written by Rust)"
arch=('x86_64')
depends=('fuse2' 'gcc-libs')
makedepends=('git' 'rust')
optdepends=("ranger: A simple, vim-like file manager")
conflicts=("gcsf")
provides=("gcsf")
url="https://github.com/harababurel/gcsf"
license=('MIT')
install="gcsf-git.install"

source=("$pkgname::git+$url.git"
		"gcsf-git.install")

sha256sums=('SKIP'
            'd5873d1ff0b1bee30f71c46fbd1a125d0581ea746a3fb58c31f08a242b6fe098')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    cargo fmt --all -- --write-mode=diff
    cargo build --release
}

package() {
    cd $srcdir/$pkgname

    # License
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    # Binaries
    install -Dm755 target/release/gcsf $pkgdir/usr/bin/gcsf
}
# vim set: ts=4 sw=4 et
