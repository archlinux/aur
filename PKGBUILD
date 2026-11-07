# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Petr Šťastný <aur@soptik.tech>

pkgname=desed
pkgver=1.2.3
pkgrel=1
pkgdesc="Debugger for sed, written in rust. Step through code and observe sed inner state."
arch=('x86_64')
url="https://github.com/soptikha2/$pkgname"
license=('GPL3')
depends=('sed')
makedepends=('cargo')
conflicts=('desed-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('10e7836f484d15e545e8c43298ca7f6c6de75278f9778e03ca73877f98c9d25f')

build() {
    cd "$pkgname-$pkgver"

    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/desed" -T "$pkgdir/usr/bin/desed"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "desed.1" -T "$pkgdir/usr/share/man/man1/desed.1"
}
