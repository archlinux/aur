# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>
# Contributor: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=fselect-git
pkgrel=2
pkgver=0.7.6.r0.g5013085
url="https://github.com/jhspetersson/fselect"
license=("MIT")
arch=(i686 x86_64)
pkgdesc='Find files with SQL-like queries'

source=("$pkgname::git+https://github.com/jhspetersson/fselect.git")
md5sums=('SKIP')
makedepends=('rust' 'git')
depends=('gcc-libs')
provides=('fselect')
conflicts=('fselect')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    install -Dm755 "$pkgname/target/release/fselect" "$pkgdir/usr/bin/fselect"
    install -Dm644 "$srcdir/$pkgname/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
