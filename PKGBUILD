#Maintainer: Nils Czernia <nils[at]czserver.de>

pkgname=hamsket-bin
_pkgname=hamsket
pkgver=0.6.2
pkgrel=1
pkgdesc='Forked Free and Open Source messaging and emailing app that combines common web applications into one'
arch=('x86_64')
depends=('alsa-lib' 'bash' 'desktop-file-utils' 'libnotify' 'libxtst' 'libxss' 'nss')
provides=('hamsket')
url='https://github.com/TheGoddessInari/hamsket'
license=('GPL3')
source=("$_pkgname.tar.gz::https://github.com/TheGoddessInari/hamsket/releases/download/$pkgver/hamsket-$pkgver.tar.gz"
        "${_pkgname}.desktop"
        "${_pkgname}.png")
sha256sums=('5a31fa8554569fd4eccdbfb8b51f099c74759fe89fd336e6413d5bb3f28dc44e'
            '18ecd40929511a7083a690ed77690571b2160200298bf589e8818aad97317f27'
            '0bf4d0c849ad6151f77b346fea0424fab910f434378f9890b16fd15a32a10064')

package() {
    install -d "${pkgdir}/"{opt/hamsket,usr/{bin,share/pixmaps}}

    cp -R "${srcdir}/hamsket-${pkgver}/"* "${pkgdir}/opt/${_pkgname}/"
    ln -rs "${pkgdir}/opt/${_pkgname}/hamsket" "${pkgdir}/usr/bin/hamsket"
    chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"

    install -Dm644 "$srcdir/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    desktop-file-install "${srcdir}/${_pkgname}.desktop" --dir "${pkgdir}/usr/share/applications/"
}
