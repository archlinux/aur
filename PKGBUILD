# Maintainer: Sergey Desyatkov <sergeidesyatkov@gmail.com>

pkgname=githubfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="Fetch GitHub profile info by username"
arch=('x86_64')
url="https://github.com/desyatkoff/$pkgname"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('rust')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('72f659a79f023214fe1e9405ca35aea40fa8dee019a4790126caf3f2fe30244d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
