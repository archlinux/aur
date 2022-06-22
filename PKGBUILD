# Maintainer: Josh Meranda <joshmeranda@gmail.com>
pkgname=wrash
pkgver=0.1.5
pkgrel=1
depends=()
pkgdesc="A minimalistic command wrapper shell"
arch=(x86_64)
url="https://github.com/joshmeranda/wrash"
license=('MIT')
groups=()
makedepends=("rust" "cargo")
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("$pkgname-$pkgver::https://github.com/joshmeranda/wrash/archive/refs/tags/$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo test -q -- --test-threads 1 --include-ignored
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
