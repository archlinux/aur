# Maintainer: Ryan Dowling <ryan@ryandowling.me>

pkgname=hyper-appimage
pkgver=2.0.0.canary.15
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('x86_64')
url="https://hyper.is"
license=('MIT')
conflicts=('hyper')
provides=('hyper')
depends=()
noextract=('Hyper.AppImage')
install=hyper-appimage.install
options=()

_pkgver_correct=${pkgver/\.canary/-canary}

source_x86_64=(
    "https://github.com/zeit/hyper/releases/download/${_pkgver_correct}/hyper-${_pkgver_correct}-x86_64.AppImage"
    "https://raw.githubusercontent.com/zeit/art/master/hyper/mark/Hyper-Mark-120@3x.png"
    "Hyper.desktop"
)

md5sums_x86_64=(
    '53e1b818d3e8f9ff647ab13e1549b55b'
    'f3481e14cba331160339b3b5ab78872b'
    '821e706405d882369108a5fa940b3078'
)

prepare() {
    cd "${srcdir}"

    mv "${srcdir}/hyper-${_pkgver_correct}-x86_64.AppImage" "${srcdir}/Hyper.AppImage"

    mkdir -p usr/share/pixmaps
    mkdir -p usr/share/applications
    mkdir -p opt/appimages
    mkdir -p usr/bin

    # move the files to the correct places
    mv "${srcdir}/Hyper-Mark-120@3x.png" usr/share/pixmaps
    mv Hyper.desktop usr/share/applications
    mv Hyper.AppImage opt/appimages/
}

package() {
    cd "${srcdir}"

    cp -rp usr "${pkgdir}/usr"
    cp -rp opt "${pkgdir}/opt"
    ln -s "${pkgdir}/opt/appimages/Hyper.AppImage" "${pkgdir}/usr/bin/hyper"
}
