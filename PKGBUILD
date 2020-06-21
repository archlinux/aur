# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=opennic-up-git
pkgver=0.97.r0.g4909019
pkgrel=1
pkgdesc="OpenNIC auto DNS updater"
arch=('any')
url="https://github.com/kewlfft/${pkgname%-git}"
license=('LGPL3')
depends=('fping' 'ldns')
makedepends=('git')
optdepends=('networkmanager')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
backup=("etc/opennic-up.conf")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%-git}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd ${pkgname%-git}
    install -Dm755 -t "${pkgdir}/usr/bin" ${pkgname%-git} 
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" ${pkgname%-git}.{service,timer}
}
