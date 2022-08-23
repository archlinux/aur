# Maintainer: Renato Molnar <m dot renato93 at gmail dot com>

pkgname=notepadpp
_pkgname=notepad-plus-plus
pkgver=8.4.4
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
            'b6c5c11518a7de1cb3ab095506ceb5a69520b19046e3e864cbfeee329fe8a250'
            '2a07301ea6fe16cb7d814653239d80722b8b432313249720f6856aec070fded0')

noextract=("npp.${pkgver}.bin.zip"
           "npp.${pkgver}.bin.x64.zip")

# If you want to package the 64bit version, you need to uncomment the following line:
#_arch=x64

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

