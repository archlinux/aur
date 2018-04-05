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
)

md5sums_x86_64=(
    '53e1b818d3e8f9ff647ab13e1549b55b',
    'f3481e14cba331160339b3b5ab78872b'
)

prepare() {
    cd "${srcdir}"

    mv "${srcdir}/hyper-${_pkgver_correct}-x86_64.AppImage" "${srcdir}/Hyper.AppImage"

    mkdir -p usr/share/pixmaps
    mkdir -p usr/share/applications
    mkdir -p opt/appimages

    # extract the hyper.desktop file out the AppImage file
    7z x "${srcdir}/Hyper.AppImage" hyper.desktop

    # move the files to the correct places
    mv "${srcdir}/Hyper-Mark-120@3x.png" usr/share/pixmaps
    mv hyper.desktop usr/share/applications
    mv Hyper.AppImage opt/appimages/
}

package() {
    cd "${srcdir}"

    cp -rp usr "${pkgdir}/usr"
    cp -rp opt "${pkgdir}/opt"
}
