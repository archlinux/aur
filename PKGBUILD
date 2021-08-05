# Maintainer: Gyara <laxect39@gmail.com>

pkgname=terminus-rust
_pkgname=terminus
pkgver=0.1.0
pkgrel=1
pkgdesc="Allows conveniently modify features of crate"
url="https://github.com/laxect/$_pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=(https://github.com/laxect/${_pkgname}/archive/v${pkgver}.tar.gz)
source=(terminus-server.service)
sha256sums=('0b751e8577a228eabe731363dec15759eba0a81d081bdbce7e17d87f91544bb5')

build()
{
    cd "$srcdir/$_pkgname-$pkgver"
    cargo build --release --target-dir=target
}

package()
{
    cd "$srcdir/$_pkgname-$pkgver"

    install -Dm 755 "target/release/terminus-server" "$pkgdir/usr/bin/terminus-server"
    install -Dm 755 "target/release/kanban" "$pkgdir/usr/bin/kanban"
    install -Dm 644 "${srcdir}/terminus-server.service" -t "${pkgdir}/usr/lib/systemd/system"

}

# vim: ts=2 sw=2 et:
