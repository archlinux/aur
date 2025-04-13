# Maintainer: Ning Sun <n@sunng.info>

pkgname=dssd
pkgver=0.3.3
pkgrel=1
pkgdesc="Dead simple freedesktop SecretService implementation"
url="https://github.com/ylxdzsw/dssd"
arch=(any)
license=(MIT)
makedepends=(cargo)
depends=(dbus)
provides=("org.freedesktop.secrets")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e8b809b1096d2a0a5fdb44d0be7fab0a8ffe65d634d4f107274bab7a8072bcdeee9cea3bd5d983c873eb87bbc81baf1bfcaf8a176dc7d2b01ab12aadb029964e')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -D target/release/dssd "$pkgdir/usr/bin/dssd"
    install -Dm644 org.freedesktop.secrets.service "$pkgdir/usr/share/dbus-1/services/org.freedesktop.secrets.service"
    install -Dm644 dssd.service "$pkgdir/usr/lib/systemd/user/dssd.service"
}
