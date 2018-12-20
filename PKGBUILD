# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=ptags-git
pkgver=r135.82ad409
pkgrel=1
pkgdesc='A parallel universal-ctags wrapper for git repository.'
arch=('i686' 'x86_64')
url='https://github.com/dalance/ptags'
license=('MIT')
makedepends=('git' 'cargo')
depends=('git' 'ctags' 'git-lfs')
provides=('ptags')
conflicts=('ptags')
source=("$pkgname"::'git+https://github.com/dalance/ptags.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -D 'target/release/ptags' "$pkgdir/usr/bin/ptags"
    install -D 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
