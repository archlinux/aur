# Maintainer Arthur Shevchenko <niktob560@yandex.ru>

pkgbase=rrot
pkgname=rrot
pkgver=r7.7cdb331
pkgrel=1
pkgdesc="Rot encoder written in rust"
license=('GPL3.0')
source=(
    "git+https://github.com/niktob560/rrot"
)
arch=('x86_64')
provides=('rrot')
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
