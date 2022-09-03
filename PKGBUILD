# Maintainer: Renato Molnar <renato dot molnar at posteo dot net>

# If you want to package the 64bit version, you need to uncomment the following line:
#_arch=x64

if [[ "${_arch}" == x64 ]]; then
    winarch='64'
else
    winarch='32'
fi

pkgname=notepadpp
_pkgname=notepad-plus-plus
pkgver=8.4.4
pkgrel=2
pkgdesc="A free source code editor for Windows - (${winarch}-bit)"
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
        "npp.${pkgver}.32.zip::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.portable.zip"
        "npp.${pkgver}.64.zip::https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/npp.${pkgver}.portable.x64.zip")

sha256sums=('3e68329f18c46a240b8c852ccfe291b78ae0c37b692f090a1b2e379892415576'
            'a1c34d444893d56ae165c8457260e11b729ea2afc10bb9e2690bc89e1f523238'
            '04c8ad254a41350078bba4d56ad54f7b4c0df125029aee021ea0ac632971ebad'
            'b6c5c11518a7de1cb3ab095506ceb5a69520b19046e3e864cbfeee329fe8a250'
            '2a07301ea6fe16cb7d814653239d80722b8b432313249720f6856aec070fded0')

noextract=("npp.${pkgver}.32.zip"
           "npp.${pkgver}.64.zip")

options=('!strip')

package() {

    install -d -m755 "${pkgdir}/usr/share/${pkgname}"

    unzip "${srcdir}/npp.${pkgver}.${winarch}.zip" -d "${pkgdir}/usr/share/${pkgname}"

    rm -rf "${pkgdir}/usr/share/${pkgname}/updater" \
           "${pkgdir}/usr/share/${pkgname}/license.txt" \

    find "${pkgdir}/usr/share/${pkgname}" -type d -exec chmod 755 "{}" \;
    find "${pkgdir}/usr/share/${pkgname}" -type f -exec chmod 644 "{}" \;

    install -D -m755 "${srcdir}/notepadpp" "${pkgdir}/usr/bin/notepadpp"
    install -D -m644 "${srcdir}/notepadpp.png" "${pkgdir}/usr/share/pixmaps/notepadpp.png"
    install -D -m644 "${srcdir}/notepadpp.desktop" "${pkgdir}/usr/share/applications/notepadpp.desktop"
}

