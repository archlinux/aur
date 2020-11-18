# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=stargazer-gmi
pkgver=0.2.0
pkgrel=1
pkgdesc="stargzer gemini server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/stargazer/"
license=('AGPL-3.0')
source=("https://git.sr.ht/~zethra/stargazer/archive/$pkgver.tar.gz")
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'scdoc' 'binutils')
sha256sums=("077aa0517b59d12689a0f83c1d1f34c674b502f53b1e6c2f4841fe1876e2e910")

build() {
    tar -xf $pkgver.tar.gz
    cd "$srcdir/$pkgname-$pkgver"
    ./scripts/build
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo run --release -- -C ./test_data/testing.ini &
    PID=$!
    ./scripts/test
    kill $PID
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    source ./scripts/install --prefix="$pkgdir/usr" --sysconfdir="$pkgdir/etc"
}
