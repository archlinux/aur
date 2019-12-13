# Maintainer: Carlos Bellino <carlosbellino@gmail.com>

pkgname=pymedusa
_gitname=Medusa
pkgver=0.3.9
pkgrel=1
pkgdesc="Automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic."
arch=('any')
url="https://github.com/${pkgname}/${_gitname}"
license=('GPL')

depends=('libmediainfo'
         'python-babel'
         'python-mako')

optdepends=('openssl'
            'unrar')

options=('!strip')

install=${pkgname}.install

source=("https://github.com/${pkgname}/${_gitname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")

sha256sums=('971220b9b23c2fa9021143a1a77f107a0d498e89f7c245aa3be1acfaba8beb65'
            '413f2788b6d98d7090c25e226894a68de89bdde16fd94dcb7a3abf74db7b70b8'
            '2353be80d2ba3ddf6a81c039acfab4f9f13b058d7df99f506d51434a76dc8a37'
            'aab2c27aa38db65175e58dd9f50558a91b8a5b8d6fd07120877e47ea1b97764e')

package() {
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"

    cp -rp "${srcdir}/${_gitname}-${pkgver}"/* "${pkgdir}/usr/lib/${pkgname}"

    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
