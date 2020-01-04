# Maintainer: Victor Zamanian <victor.zamanian@gmail.com>

pkgname=pomotroid
pkgver=0.6.2
pkgrel=1
pkgdesc="Simple and visually-pleasing Pomodoro timer"
arch=('x86_64')
url="https://github.com/Splode/pomotroid"
license=('MIT')
depends=('zlib')
options=(!strip)
source_x86_64=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/pomotroid-${pkgver}-${arch}.AppImage"
               "https://raw.githubusercontent.com/Splode/pomotroid/master/LICENSE"
               "pomotroid.desktop"
              )
noextract=("${pkgname}-${pkgver}.AppImage")
md5sums_x86_64=('eb5320db172dcc6f8fd4038fbf0089b7'
                '98368ac76439a0812a58d0a586b28ed1'
                'fc957aa0ee7730a4773a63da2baeabad')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/pomotroid.desktop" "${pkgdir}/usr/share/applications/pomotroid.desktop"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

    # Symlink license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
