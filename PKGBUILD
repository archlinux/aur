# Maintainer Arthur Shevchenko <niktob560@yandex.ru>

pkgbase=rbase64
pkgname=rbase64
pkgver=r6.9a1be43
pkgrel=1
pkgdesc="Base64 encoder written in rust"
license=('GPL3.0')
source=(
    "git+https://github.com/niktob560/rbase64"
)
arch=('x86_64')
provides=('rbase64')
sha1sums=('SKIP')
makedeps=(
   cargo
   git
)

build() {
    cd $srcdir/$pkgname
    cargo build --release --locked --all-features
}

package() {
    cd $srcdir/$pkgname
    mkdir -p $pkgdir/usr/bin/
    install -m 0555 $srcdir/$pkgname/target/release/$pkgname $pkgdir/usr/bin/$pkgname
}

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#vim: syntax=sh
