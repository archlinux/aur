# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>

pkgname=expressvpn
pkgver=1.0
pkgrel=1
pkgdesc="ExpressVPN client for Linux"
arch=('x86_64')
url="https://expressvpn.com"
license=('custom')
depends=()
optdepends=()

source_x86_64=("https://d11cv8afjim9ws.cloudfront.net/clients/linux/${pkgname}_${pkgver}_amd64.deb"
               "https://d11cv8afjim9ws.cloudfront.net/clients/linux/expressvpn_1.0_amd64.deb.asc"
)

sha512sums_x86_64=('3443c56ff1b827048c9494d8b3ccbc77e4124650937976cea70d9fc0a4fed894b76a724b9628bb66a6be0fb5a5dfc7ffa8073ebccc20676a3d8571282af7f4c6'
                   'SKIP')

package() {

    bsdtar -O -xf "${startdir}/${pkgname}_${pkgver}_amd64.deb" data.tar.gz | bsdtar -C "$pkgdir" -xzf -
    
    #find "${pkgdir}" -type d -print0 | xargs -0 chmod 755

    # The cron.daily script is toxic... manipulating keys and sources list on debian.
    # These don't even work on Arch.  Someday a proper systemd.timer service will exist if necessary.
    #rm -rf "${pkgdir}/etc/cron.daily"
}
