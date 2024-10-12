# Maintainer: tunalad <tunalad@proton.me>
pkgname=hlam
pkgver=3.0.0
pkgrel=1
pkgdesc="Half-Life Asset Manager"
arch=('x86_64')
url="https://github.com/SamVanheer/HalfLifeAssetManager"
license=('custom:HLAM') # Custom license
depends=(
    'glibc'
    'gcc-libs'
    'openal'
    'qt5-base'
    'qt5-x11extras'
    #'qt5-networkauth'
    'qt5-tools'
)
makedepends=()
source=("https://github.com/SamVanheer/HalfLifeAssetManager/releases/download/HLAM-V${pkgver}/halflifeassetmanager_${pkgver}_amd64.deb" "hlam.desktop")
sha256sums=(SKIP SKIP)

prepare() {
    # extract the debian package
    ar -x halflifeassetmanager_${pkgver}_amd64.deb
}

package() {
    cd "$srcdir"

    # extract the data.tar.gz
    tar -xzvf data.tar.gz

    # install the binary
    install -Dm755 usr/bin/hlam "${pkgdir}/usr/bin/${pkgname}"

    # copy the other necessary files
    cp -r usr/share "${pkgdir}/usr/share"

    # install the desktop file
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # install the icon
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    cp usr/share/icons/hicolor/128x128/apps/hlam.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"

    # install the manual
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r usr/share/'Half-Life Asset Manager'/'Half-Life Asset Manager'/HalfLifeAssetManagerManual.pdf "${pkgdir}/usr/share/doc/${pkgname}/manual.pdf"

    # there's no license file found in the debian package :/
}
