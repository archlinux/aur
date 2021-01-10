# Maintainer: ondoho <buababg-tvguho@cbfgrb.qr(rot13)>
# Contributor: ondoho <buababg-tvguho@cbfgrb.qr(rot13)>
pkgname=opennic-resolve-git
pkgver=1
pkgrel=2
pkgdesc="OpenNIC DNS updater"
arch=('any')
url="https://notabug.org/ohnonot/${pkgname%-git}"
license=('GPL3')
depends=('bash' 'jq' 'curl' 'coreutils')
makedepends=('git')
optdepends=('systemd')
backup=("etc/${pkgname%-git}/${pkgname%-git}.conf")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname}"
    install -Dm755 -t "${pkgdir}/usr/bin" ${pkgname%-git} 
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ${pkgname%-git}.{service,timer}
    install -Dm644 -t "${pkgdir}/etc/${pkgname%-git}" ${pkgname%-git}.conf
}
