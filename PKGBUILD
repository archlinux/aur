# Maintainer: Atthun Seeran R.A. <idkatthun@gmail.com>
pkgname=microfetch
pkgver=1.0.0
pkgrel=1
pkgdesc='Minimalist system fetch tool for Arch Linux'
url='https://github.com/Atthun/microfetch-arch-linux'
arch=('x86_64')
license=('GPL3')
depends=()
makedepends=('cargo')
source=("git+https://github.com/Atthun/microfetch-arch-linux.git#branch=main")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/microfetch-arch-linux"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    cd "$srcdir/microfetch-arch-linux"
    cargo build --release --target-dir target
}

package() {
    cd "$srcdir/microfetch-arch-linux"
    install -Dm755 target/release/microfetch "$pkgdir/usr/bin/microfetch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
