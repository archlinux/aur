# Maintainer: Carlos Bellino <carlosbellino@gmail.com>

pkgname=pymedusa
_gitname=Medusa
pkgver=0.3.0
pkgrel=2
pkgdesc="Automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic."
arch=('any')
url="https://github.com/${pkgname}/${_gitname}"
license=('GPL')

depends=('python-babel'
         'python-mako')

optdepends=('unrar')

conflicts=(${_pkgname}
           'sickbeard'
           'sickrage'
           'sickrage-git'
           'sickrage2-git'
           'sickgear-git')

options=('!strip')
install=${pkgname}.install

source=("https://github.com/${pkgname}/${_gitname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")

md5sums=('49c939f78489739795a90675a9c81ad6'
         '70428465c0573416be09c0acb9033a51'
         '2ebbebb6d18e2ebf3bfab4d2c71c5b58'
         '1196c8220c501c6e667132a0b945d03d')

package() {
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${pkgdir}/var/lib/${pkgname}"

    cp -rp "${srcdir}/${_gitname}-${pkgver}"/* "${pkgdir}/usr/lib/${pkgname}"

    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
