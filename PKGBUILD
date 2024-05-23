# Maintainer: Your Name <your.email@example.com>
pkgname=pgmq
pkgver=1.2.1
pkgrel=1
pkgdesc="A lightweight message queue. Like AWS SQS and RSMQ but on Postgres."
arch=('x86_64')
url="https://github.com/tembo-io/pgmq"
license=('MIT')
depends=('postgresql')
makedepends=('git' 'cargo' 'cargo-pgrx')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tembo-io/pgmq/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f522c0938b8c7cfc30d3142e684853a417e66762eaa7cf0be238af93f9f5bb14')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo pgrx init --pg16 $(which pg_config)
    cargo pgrx package --pg-config=$(which pg_config)
}

package() {
    cd "$srcdir/$pkgname-$pkgver/target/release/pgmq-pg16/usr"
    install -dm755 "$pkgdir"/usr
    cp -r * "$pkgdir"/usr
}
