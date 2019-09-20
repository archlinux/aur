#Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=hamsket-bin
_pkgname=hamsket
pkgver=0.5.19
pkgrel=1
pkgdesc='Forked Free and Open Source messaging and emailing app that combines common web applications into one'
arch=('x86_64')
depends=('alsa-lib' 'bash' 'desktop-file-utils' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'libxss' 'nss')
provides=('hamsket')
conflicts=('rambox' 'rambox-os-git' 'rambox-bin' 'ramboxpro-bin' 'rambox-os-bin' 'rambox-os')
url='https://github.com/TheGoddessInari/hamsket'
license=('GPL3')
source=("$_pkgname.tar.gz::https://github.com/TheGoddessInari/hamsket/releases/download/$pkgver/Rambox-$pkgver.tar.gz"
        "${_pkgname}.desktop"
        "${_pkgname}.png")
sha256sums=('b5086d826ab4f4f417599f7e84e630808292b7cfef28252c165bff69dab26ff6'
            '688c911beb23d63234b29b912a744644957cffe944c6cdd068bd5c55423ae98c'
            '0bf4d0c849ad6151f77b346fea0424fab910f434378f9890b16fd15a32a10064')

package() {
    install -d ${pkgdir}/{opt/hamsket,usr/{bin,share/pixmaps}}

    cp -R ${srcdir}/Rambox-${pkgver}/* ${pkgdir}/opt/${_pkgname}/
    ln -rs ${pkgdir}/opt/${_pkgname}/rambox ${pkgdir}/usr/bin/rambox
    chmod 4755 ${pkgdir}/opt/${_pkgname}/chrome-sandbox

    install -Dm644 $srcdir/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

    desktop-file-install ${srcdir}/${_pkgname}.desktop --dir ${pkgdir}/usr/share/applications/
}
