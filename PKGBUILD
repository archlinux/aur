# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: simoesgabriel
# Maintainer: swalladge <swalladge at gmail dot com> 

pkgname=sputnik
_pkgname=Sputnik
pkgver=1.0.7
pkgrel=4
pkgdesc="Simple and practical RSS reader."
arch=('x86_64')
url="http://sputnik.szwacz.com"
license=('GPLv3')
depends=('alsa-lib' 'gconf' 'gdk-pixbuf2' 'libpng' 'nss')
source=("${pkgname}.run"::"http://sputnik.szwacz.com/downloads/${_pkgname}-v${pkgver}.run")
md5sums=('5c32ff4eae9f20fc054efdfee79f12ef')
options=('!strip')

package() {
    install -d "${srcdir}/${pkgname}/"
    sh "${pkgname}.run" --tar -xf -C "${srcdir}/${pkgname}"

    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/opt/"
    cp -r -f "${_pkgname}" "${pkgdir}/opt"
    ln -sf "/usr/lib/libudev.so.1" "${pkgdir}/opt/${_pkgname}/libudev.so.0"
    chmod -R 755 "${pkgdir}/opt/${_pkgname}"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

