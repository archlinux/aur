# Maintainer: Ryan Dowling <ryan@ryandowling.me>

pkgname=hyper-appimage
pkgver=2.0.0.canary.15
pkgrel=10
pkgdesc="A terminal built on web technologies"
arch=('x86_64')
url="https://hyper.is"
license=('MIT')
conflicts=('hyper')
provides=('hyper')
depends=()
noextract=('Hyper.AppImage')
install=hyper-appimage.install
options=('!strip')

_pkgver_correct=${pkgver/\.canary/-canary}

source_x86_64=(
    "https://github.com/zeit/hyper/releases/download/${_pkgver_correct}/hyper-${_pkgver_correct}-x86_64.AppImage"
    "https://raw.githubusercontent.com/zeit/art/master/hyper/mark/Hyper-Mark-120@3x.png"
    "Hyper.desktop"
)

md5sums_x86_64=(
    '53e1b818d3e8f9ff647ab13e1549b55b'
    'f3481e14cba331160339b3b5ab78872b'
    '1cfb0ca92bb3bebfd95da621c4fa0a84'
)

package() {
    # Install the main files.
    install -D -m755 "${srcdir}/hyper-${_pkgver_correct}-x86_64.AppImage" "${pkgdir}/opt/${pkgname}/Hyper.AppImage"

    # Desktop Entry
    install -D "${srcdir}/Hyper.desktop" "${pkgdir}/usr/share/applications/Hyper.desktop"

    # Main binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Hyper.AppImage" "${pkgdir}/usr/bin/hyper"

    # Install the icon
    install -D "${srcdir}/Hyper-Mark-120@3x.png" "${pkgdir}/usr/share/pixmaps/Hyper.png"
}
