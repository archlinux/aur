# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>

pkgname=shellfirm
pkgver=0.2.2
pkgrel=1
pkgdesc='Intercept any risky patterns (default or defined by you) and prompt you a small challenge for double verification'
arch=('x86_64')
url='https://github.com/kaplanelad/shellfirm'
makedepends=('git' 'rust')
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kaplanelad/shellfirm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4ad9768052864d4cb2d88aec73028d44ca82bd661d93cfae02d28188e9d7685e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

test() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/shellfirm $pkgdir/usr/bin/shellfirm
    install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m 644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/

    cd docs
    install -d -m 755 "${pkgdir}/usr/share/doc/${pkgname}"
    find . -type d -exec install -d {,"$pkgdir"/usr/share/doc/${pkgname}/}{} \;
    find . -type f -exec install -D {,"$pkgdir"/usr/share/doc/${pkgname}/}{} \;
}
