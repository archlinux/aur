#Maintainer: Nico Suarez <nicodoggie@gmail.com>
#Contributor: freaknils <nils[AT]czserver.de>

pkgname=hamsket-nightly-bin
_pkgname=hamsket
pkgver=0.6.0
pkgrel=5
pkgdesc='Forked Free and Open Source messaging and emailing app that combines common web applications into one'
arch=('x86_64')
depends=('alsa-lib' 'bash' 'desktop-file-utils' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'libxss' 'nss')
provides=('hamsket')
conflicts=('rambox' 'rambox-os-git' 'rambox-bin' 'ramboxpro-bin' 'rambox-os-bin' 'rambox-os' 'hamsket-bin')
url='https://github.com/TheGoddessInari/hamsket'
license=('GPL3')
source=("$_pkgname.tar.gz::https://github.com/TheGoddessInari/hamsket/releases/download/nightly/$_pkgname-$pkgver.tar.gz"
        "${_pkgname}.desktop"
        "${_pkgname}.png")
sha256sums=('4e0056e38f49d2782238c58934e51d7329cec759a94e1a083d3bb42e0c36af9c'
            '18ecd40929511a7083a690ed77690571b2160200298bf589e8818aad97317f27'
            '0bf4d0c849ad6151f77b346fea0424fab910f434378f9890b16fd15a32a10064')

package() {
    install -d ${pkgdir}/{opt/hamsket,usr/{bin,share/pixmaps}}

    cp -R ${srcdir}/hamsket-${pkgver}/* ${pkgdir}/opt/${_pkgname}/
    ln -rs ${pkgdir}/opt/${_pkgname}/hamsket ${pkgdir}/usr/bin/hamsket
    chmod 4755 ${pkgdir}/opt/${_pkgname}/chrome-sandbox

    install -Dm644 $srcdir/${_pkgname}.png ${pkgdir}/usr/share/pixmaps/${_pkgname}.png

    desktop-file-install ${srcdir}/${_pkgname}.desktop --dir ${pkgdir}/usr/share/applications/
}
