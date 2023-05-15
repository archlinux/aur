# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=shellfirm-bin
pkgorg=shellfirm
pkgver=0.2.6
pkgrel=1
pkgdesc='Intercept any risky patterns (default or defined by you) and prompt you a small challenge for double verification'
arch=('x86_64')
url='https://github.com/kaplanelad/shellfirm'
makedepends=('git' 'rust')
license=('Apache')
source=("$pkgorg-$pkgver.tar.gz::https://github.com/kaplanelad/shellfirm/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0dd22e933763e01e14e816ae839c54d0b48fd802ddee8ae3fe66043a47b1411b')

build() {
    cd "$srcdir/$pkgorg-$pkgver"
    cargo build --release
}

test() {
    cd "$srcdir/$pkgorg-$pkgver"
    cargo test --release
}

package() {
    cd "$srcdir/$pkgorg-$pkgver"
    install -Dm755 target/release/shellfirm $pkgdir/usr/bin/shellfirm
    install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgorg}"
    install -D -m 644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgorg}"/

    cd docs
    install -d -m 755 "${pkgdir}/usr/share/doc/${pkgorg}"
    find . -type d -exec install -d {,"$pkgdir"/usr/share/doc/${pkgorg}/}{} \;
    find . -type f -exec install -D {,"$pkgdir"/usr/share/doc/${pkgorg}/}{} \;
}
