# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Max Falk <gmdfalk at gmail dot com>

pkgname=rocketchat-server
pkgver=0.52.0
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
sha512sums=('b1bb6e0d2f6e261f2d14c16578421292f75ca16a353b76403390be7e07bb518e2168e1a11b33ddbafe628e7365c3c3bdbfd5165c21f582275e4ae66d5906c8c9'
         'f4cde106e9912ea476cb19858141da4eb57d7e92a70898564a4dd704cc3421933bdda3d0ee36840af1986d1ee62949e9110bafac27660e9eaaad9e116870b3dd'
         '6700fae043f59881c0c8821db176a8d9cbbf7f047bd48750dbcd7abd7c531831436f910a28745b40d4d2fcbb7d2081b5512a5ee23ea6355bb065fde3b0672edc'
         '4ff8899a47612a81f73c1c6449fb30a7ddfb0b199756db7f73e0a3078cf818b88e481fd828296b148a348d137ae529ce591d6c2bd6b57ae9278188e715086b59'
         '0086f72f16a594116586d4b6783b104f7bba779e4f8e31e5988c7fa67e1c7d9fc95215d0a04c4f24c72b4183774a9768a29b05c828990125dd4a3379a69aa648'
         '05601d05fe993cd643c6a2dec3b8ad00c0a4906ee5db7856a118f5672b4d2a567f39e81db3fdb30186ddac22348566eca79f1588d633818d004ac286e364a575')

package() {
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -dr --no-preserve=ownership "${srcdir}/bundle" "${pkgdir}/usr/share/"
    mv "${pkgdir}/usr/share/bundle" "${pkgdir}/usr/share/${pkgname}"

    install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}.sh"
    install -Dm644 ${pkgname}.conf "${pkgdir}/etc/rocketchat/${pkgname}.conf"
    install -Dm644 rocketchat.service "${pkgdir}/usr/lib/systemd/system/rocketchat.service"
    install -Dm644 rocketchat-user.conf "${pkgdir}/usr/lib/sysusers.d/rocketchat.conf"
}
