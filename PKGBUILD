# Maintainer: 4679kun <4679kun@outlook.com>
# Contributor: Alexander Sobolevkiy <smak.nsk@gmail.com>

pkgname=servicectl
pkgver=1.0
pkgrel=1
pkgdesc="Control daemons for systemd in chroot environment"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/smaknsk/servicectl"
license=('GPL')
depends=('systemd')
source=("https://github.com/smaknsk/servicectl/archive/${pkgver}.tar.gz")
md5sums=('22230a7c9c599147b7feb4d5333b612d')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    
    mkdir -p "${pkgdir}/usr/lib/servicectl/enabled" || return 1
    install -D -m 755 servicectl "${pkgdir}/usr/lib/servicectl/servicectl" || return 1
    install -D -m 755 serviced "${pkgdir}/usr/lib/servicectl/serviced" || return 1
    cp {README.md,README_ru.md} "${pkgdir}/usr/lib/servicectl/" || return 1

    mkdir -p "${pkgdir}/usr/bin" || return 1
    ln -s "/usr/lib/servicectl/servicectl" "${pkgdir}/usr/bin/servicectl" || return 1
    ln -s "/usr/lib/servicectl/serviced" "${pkgdir}/usr/bin/serviced" || return 1
}
