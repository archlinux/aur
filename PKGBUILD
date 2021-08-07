# Maintainer: Gyara <laxect39@gmail.com>

pkgname=terminus-rust
_pkgname=terminus
pkgver=0.1.4
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

sha256sums=('db46238147089a663173a9aaa9b632d89f2f1dd219e105f149da32399f15e087'
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
