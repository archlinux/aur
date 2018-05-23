pkgname=mates-git
pkgver=r185
pkgrel=1
pkgdesc='A very simple commandline addressbook, with mutt integration and optional CardDAV synchronization.'
arch=('i686' 'x86_64')
url='https://github.com/untitaker/mates.rs'
license=('MIT')
makedepends=('git' 'rust' 'cargo')
depends=('gcc-libs')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    echo -n "r"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package(){
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/mates "$pkgdir/usr/bin/mates"

    install -Dm644 "target/release/build/mates-"*/out/mates.bash "$pkgdir/usr/share/bash-completion/completions/mates"
    install -Dm644 "target/release/build/mates-"*/out/mates.fish "$pkgdir/usr/share/fish/completions/mates.fish"
    install -Dm644 "target/release/build/mates-"*/out/_mates "$pkgdir/usr/share/zsh/site-functions/_mates"
}
