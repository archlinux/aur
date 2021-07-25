# Maintainer: Renato Molnar <m dot renato93 at gmail dot com>

#_arch=x64

pkgname=notepadpp
_pkgname=notepad-plus-plus
pkgver=8.1.2
pkgrel=1
pkgdesc="A free source code editor for Windows"
arch=('x86_64')
url="https://${_pkgname}.org/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('wine' 'sh' 'fuse-overlayfs')
makedepends=('unzip')
provides=(notepadpp)
conflicts=('notepadpp-win32' 'notepadpp-win64')
source=(notepadpp
        notepadpp.desktop
        notepadpp.png
        "https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.portable.zip"
        "https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.portable.x64.zip")

sha256sums=('d4352139a459f532b807262b5b1933c98142fc772de713abc39e6073d291b200'
            'a1c34d444893d56ae165c8457260e11b729ea2afc10bb9e2690bc89e1f523238'
            '04c8ad254a41350078bba4d56ad54f7b4c0df125029aee021ea0ac632971ebad'
            'e10c1cb87c3c1fb3d69eba24edccd4d261968edc2f5a5c3e9caf5d237124bdae'
            '3e9a8ec74f2c41478b1b3212b44603bdab08e993fe9be5cc4d0fc443d7e8e42d')

noextract=("npp.${pkgver}.bin.zip"
           "npp.${pkgver}.bin.x64.zip")

if [[ "${_arch}" == x64 ]]; then
    _arch='.x64'
    pkgdesc+=" (64-bit)"
else
    _arch=''
    pkgdesc+=" (32-bit)"
fi

options=('!strip')

package() {

    install -d -m755 "${pkgdir}/usr/share/${pkgname}"

    unzip "${srcdir}/npp.${pkgver}.portable${_arch}.zip" -d "${pkgdir}/usr/share/${pkgname}"

    rm -rf "${pkgdir}/usr/share/${pkgname}/updater" \
           "${pkgdir}/usr/share/${pkgname}/license.txt" \

    find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;
    find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;

    install -D -m755 "${srcdir}/notepadpp" "${pkgdir}/usr/bin/notepadpp"
    install -D -m644 "${srcdir}/notepadpp.png" "${pkgdir}/usr/share/pixmaps/notepadpp.png"
    install -D -m644 "${srcdir}/notepadpp.desktop" "${pkgdir}/usr/share/applications/notepadpp.desktop"
}

