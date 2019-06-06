# Maintainer: Carlos Bellino <carlosbellino@gmail.com>

pkgname=pymedusa
_gitname=Medusa
pkgver=0.3.2
pkgrel=1
pkgdesc="Automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic."
arch=('any')
url="https://github.com/${pkgname}/${_gitname}"
license=('GPL')

depends=('python-babel'
         'python-mako')
optdepends=('unrar')

options=('!strip')

install=${pkgname}.install

source=("https://github.com/${pkgname}/${_gitname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")

md5sums=('743881a83b029930760313c029c49016'
         '70428465c0573416be09c0acb9033a51'
         '2ebbebb6d18e2ebf3bfab4d2c71c5b58'
         '823389ad500b5f8a18bc2a09c0bf9310')

package() {
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"

    cp -rp "${srcdir}/${_gitname}-${pkgver}"/* "${pkgdir}/usr/lib/${pkgname}"

    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
