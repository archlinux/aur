pkgname=sshtm
pkgver=1.1.4
pkgrel=1
pkgdesc="SSH Tunnel Manager"
arch=('x86_64')
url="https://github.com/besrabasant/ssh-tunnel-manager"
license=('MIT')
depends=("openssh")
makedepends=('go' 'git' 'make')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/besrabasant/ssh-tunnel-manager/archive/refs/tags/v$pkgver.tar.gz"
    "sshtm.path.sh"
    "sshtmd.service"
    "sshtm.install"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
install=sshtm.install

build() {
    cd "${srcdir}/ssh-tunnel-manager-$pkgver"
    make GOFLAGS="-trimpath"
}

package() {
    cd "${srcdir}/ssh-tunnel-manager-$pkgver"
    install -Dm755 sshtm "$pkgdir/usr/share/sshtm/bin/sshtm"
    install -Dm755 sshtmd "$pkgdir/usr/share/sshtm/bin/sshtmd"
    install -Dm755 scripts/uninstall.sh "$pkgdir/usr/share/sshtm/uninstall.sh"
    install -Dm644 "${srcdir}/sshtm.path.sh" "$pkgdir/etc/profile.d/sshtm.sh"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "${srcdir}/sshtmd.service" "$pkgdir/usr/lib/systemd/user/sshtmd.service"
}
