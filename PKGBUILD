# Maintainer: Gyara <laxect39@gmail.com>

pkgname=terminus-rust
_pkgname=terminus
pkgver=0.1.2
pkgrel=1
pkgdesc="Text board in tui"
url="https://github.com/laxect/$_pkgname"
arch=("x86_64")
license=("MIT")
depends=("cargo")
source=(
  "https://github.com/laxect/${_pkgname}/archive/v${pkgver}.tar.gz"
  "terminus-server.service"
)

sha256sums=('9b8aacc15e2f1756559f9e85c7f789caaf28efda19326bd46217b6cad4398133'
            'e194ff8ba6fc62539f8d4b573f126b0f08f3a4d9f1ae607dee0534d4ec4129d3')

build()
{
    cd "$srcdir/$_pkgname-$pkgver"
    cargo build --release --target-dir=target
}

package()
{
    cd "$srcdir/$_pkgname-$pkgver"

    install -d "${pkgdir}/usr/share/terminus"
    install -Dm 755 "target/release/terminus-server" "$pkgdir/usr/bin/terminus-server"
    install -Dm 755 "target/release/kanban" "$pkgdir/usr/bin/kanban"
    install -Dm 644 "${srcdir}/terminus-server.service" -t "${pkgdir}/usr/lib/systemd/system"

}

# vim: ts=2 sw=2 et:
