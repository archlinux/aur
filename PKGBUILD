# Maintainer: laggykiller <chaudominic2 at gmail dot com>
pkgname=sticker-convert
pkgver=2.16.2.0
pkgrel=1
pkgdesc='Convert (animated) stickers to/from WhatsApp, Telegram, Signal, Line, Kakao, Viber, Discord, iMessage. Written in Python.'
arch=('x86_64' 'aarch64')
url="https://github.com/laggykiller/sticker-convert"
license=('GPLv2')
options=(!strip)
source_x86_64=(
    "sticker-convert-linux-x86_64-${pkgver}.zip::https://github.com/laggykiller/sticker-convert/releases/download/v${pkgver}/${pkgname}-linux-x86_64.zip"
    "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/laggykiller/${pkgname}/v${pkgver}/LICENSE")
source_aarch64=(
    "sticker-convert-linux-aarch64-${pkgver}.zip::https://github.com/laggykiller/sticker-convert/releases/download/v${pkgver}/${pkgname}-linux-aarch64.zip"
    "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/laggykiller/${pkgname}/v${pkgver}/LICENSE")
sha256sums_x86_64=('3ac52aef80b94506e67db016abcd91b8743d21dafd466984dc54013ce26f47bd'
                   '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_aarch64=('1cf643528630332148f16efbdd03c6a5963c1fa67eba5f1c4f9b9a9d8dba52fa'
                    '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')

prepare() {
    echo "Name=sticker-convert" > sticker-convert.desktop
    echo "Exec=/opt/sticker-convert/sticker-convert.bin" >> sticker-convert.desktop
    echo "Icon=sticker-convert" >> sticker-convert.desktop
    echo "Type=Application" >> sticker-convert.desktop
    echo "Terminal=false" >> sticker-convert.desktop
    echo "Categories=Utility;" >> sticker-convert.desktop
    echo "Comment=Convert (animated) stickers between WhatsApp, Telegram, Signal, Line, Kakao, Viber, Discord, iMessage" >> sticker-convert.desktop
}

package() {
    # Program
    mkdir -p "${pkgdir}/opt"
    cp -r ${srcdir}/${pkgname}-linux-${CARCH} "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/sticker-convert.desktop"\
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    cp -a "${pkgdir}/opt/${pkgname}/resources/appicon.png" "${pkgdir}/usr/share/pixmaps/sticker-convert.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.bin" "${pkgdir}/usr/bin/${pkgname}"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
