# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=cb-git
_pkgname=cb
pkgver=0.1.0.r3.gb68417d
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/yaa110/cb"
license=("MIT")

pkgdesc='Command line interface to manage clipboard'

source=("$_pkgname::git://github.com/yaa110/cb.git")
sha512sums=('SKIP')
makedepends=('rust' 'python3')
depends=('gcc-libs' 'libxcb')
conflicts=('cb' 'cb-bin')
provides=('cb')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    cargo build --release
}

package() {
    install -Dm755 "$_pkgname/target/release/cli" "$pkgdir/usr/bin/cb"
    install -Dm644 "$_pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
