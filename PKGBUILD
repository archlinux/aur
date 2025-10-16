# Maintainer: Alexey Galakhov <agalakhov@gmail.com>

pkgname=totpm
pkgver=0.1.2
pkgrel=5
pkgdesc="A TPM-backed command line TOTP/2FA client, using fprintd for user presence checking."
url="https://github.com/koditoriet/totpm"
license=("MIT")
arch=("x86_64")
depends=('gcc-libs' 'glibc' 'dbus' 'tpm2-tss' 'sqlite')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/koditoriet/totpm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("eed4e1c8f13908731dc11ed667765652bc176ac30afa478f81056c1434f750ba")
install=$pkgname.install

build() {
    cd totpm-$pkgver
    cargo build --release
}

package() {
    cd totpm-$pkgver
    install -Dm755 target/release/totpm -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 totpm.conf "$pkgdir/etc/totpm.conf"
    install -Dm644 totpm.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    mkdir -p "$pkgdir/var/lib/totpm"
    chmod 700 "$pkgdir/var/lib/totpm"
}
