# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=altirra
pkgver=4.20
pkgrel=1
pkgdesc='An 8-bit Atari computer emulator, on Wine'
arch=('any')
url='https://www.virtualdub.org/altirra.html'
license=('GPL2')
depends=('wine'
         'wine-mono')
optdepends=('wine-gecko: HTML help pages support')
provides=('altirra')
source=("https://www.virtualdub.org/downloads/Altirra-$pkgver.zip"
        'http://atari.vjetnam.cz/dow/emuROMs.zip'
        'altirra'
        'altirra.desktop'
        'altirra.png'
        'application-altirra.xml')
sha256sums=('434b6fd3013f29eb4bebecc9913f5bc8c00c4163031e46db31718d8cdc3d0b83'
            'f6bebc7d367d59dd1789fd17450c9a4eb329c27a5b5345f42d4854f412a45221'
            'c6aab8083ed7e68c82ffc5b74497a87610f5f11a218ec42fe67fcf827d5a62c0'
            '713b375c8467da838f4c4c9f1eca2a947aecc6c429161bc67eeedecc7c81b620'
            '5319fd88751fa886683d955976ed74eb266e9ea462ae77431b6a6c457ce42dc1'
            'cd3a40e290d999912767a70ffc8e4185019290251b350f887f4a2fa972b6c96b')

package() {
    _dest="${pkgdir}/opt/${pkgname}"
    _share="${pkgdir}"/usr/share
    _bin="${pkgdir}/usr/bin"

    # windows program files
    # omits extras/
    install -D -m644 -t "${_dest}"/ Additions.atr Altirra.chm Altirra64.exe
    # shell script
    install -D -t "${_dest}" altirra
    # firmware roms
    mv atari5200.rom 5200.ROM
    install -D -m644 -t "${_dest}/roms/" 5200.ROM ATARIBAS.ROM ATARIOSB.ROM ATARIXL.ROM
    # desktop entry
    install -D -m644 -t "${_share}/applications" ${pkgname}.desktop
    install -D -m644 -t "${_share}/pixmaps" ${pkgname}.png
    install -D -m644 -t "${_share}/mime/packages" application-${pkgname}.xml
    # PATH symlink
    install -d "${_bin}"
    ln -s /opt/${pkgname}/${pkgname} "${_bin}/${pkgname}"
}
