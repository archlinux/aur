# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=expressvpn
pkgver=1.0
pkgrel=2
pkgdesc="ExpressVPN client for Linux"
arch=('x86_64')
url="https://expressvpn.com"
license=('custom')
# net-tools is needed for old skool ifconfig
depends=('net-tools')
optdepends=()

source_x86_64=("https://d11cv8afjim9ws.cloudfront.net/clients/linux/${pkgname}_${pkgver}_amd64.deb"
               "https://d11cv8afjim9ws.cloudfront.net/clients/linux/${pkgname}_${pkgver}_amd64.deb.asc"
               "expressvpn.service"
)

sha512sums_x86_64=('3443c56ff1b827048c9494d8b3ccbc77e4124650937976cea70d9fc0a4fed894b76a724b9628bb66a6be0fb5a5dfc7ffa8073ebccc20676a3d8571282af7f4c6'
                   'SKIP'
                   'b0fbdd78c58c6fe2258d56125b678533215f5bb46072aafd28478b3e43867fbfbfd84d8aa76e5ac5351c8010cb5bffaff4464d5762f479601a41a720d58a7239')

package() {

    # /usr/sbin is a symlink to /usr/bin, rewrite it
    bsdtar -O -xf "${startdir}/${pkgname}_${pkgver}_amd64.deb" data.tar.gz \
        | bsdtar -C "${pkgdir}" -s ":/usr/sbin:/usr/bin:" -xzf -

    rm -rf "${pkgdir}/etc/init.d"
    install -D "${startdir}/expressvpn.service" "${pkgdir}/lib/systemd/system/expressvpn.service"
}
