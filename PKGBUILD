# Maintainer: Max Falk <gmdfalk at gmail dot com>

pkgname=rocketchat-server
pkgver=0.36.0
pkgrel=1
pkgdesc="An open source web chat platform"
arch=("any")
url="https://rocket.chat"
license=("MIT")
depends=("nvm" "mongodb" "graphicsmagick" "curl")
makedepends=()
optdepends=()
backup=("etc/rocketchat/${pkgname}.conf")

install="${pkgname}.install"
source=("https://rocket.chat/releases/${pkgver}/download"
        "rocketchat-server.sh"
        "rocketchat-server.install"
        "rocketchat-server.conf"
        "rocketchat-user.conf"
        "rocketchat.service")
md5sums=('b030510b9cd5486d1fab40ee3a047ee1'
         'f2ba9147f0b11f33c7d55ec6124b7837'
         '94a846b48cb2e2624a54f9a047399980'
         '45a09782576f81377aa1305475bc79db'
         'c1f887698196e08963036c9de4106a03'
         '21afc6655eb6cb423c10fe25ebdef07e')

package() {
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -dr --no-preserve=ownership "${srcdir}/bundle" "${pkgdir}/usr/share/"
    mv "${pkgdir}/usr/share/bundle" "${pkgdir}/usr/share/${pkgname}"

    install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}.sh"
    install -Dm644 ${pkgname}.conf "${pkgdir}/etc/rocketchat/${pkgname}.conf"
    install -Dm644 rocketchat.service "${pkgdir}/usr/lib/systemd/system/rocketchat.service"
    install -Dm644 rocketchat-user.conf "${pkgdir}/usr/lib/sysusers.d/rocketchat.conf"
}
