# Maintainer: Ning Sun <n@sunng.info>

pkgname=dssd
pkgver=0.3.2
pkgrel=1
pkgdesc="Dead simple freedesktop SecretService implementation"
url="https://github.com/ylxdzsw/dssd"
arch=(any)
license=(MIT)
makedepends=(cargo)
depends=(dbus)
provides=("org.freedesktop.secrets")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('0d35a92c476dace937f3763d4ed44d90fbb7670163d1b2955997ab19716710593a1fab8bc66616d4e0234e3764cacd8739865ad3046c86377b117de365edefb7')

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
