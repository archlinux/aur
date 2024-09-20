# Maintainer: Ning Sun <n@sunng.info>

pkgname=dssd
pkgver=0.3.0
pkgrel=1
pkgdesc="Dead simple freedesktop SecretService implementation"
url="https://github.com/ylxdzsw/dssd"
arch=(any)
license=(MIT)
makedepends=(cargo)
depends=(dbus)
provides=("org.freedesktop.secrets")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('16fa35e5c31dbcb02e6e308adaeebfe82c1aa5e88dcbcd18dbc4bebd00ca88adcfeb700be3bfbafdaa39b160eff0b248defc54776b5087c5f2d4cafa677519be')

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
