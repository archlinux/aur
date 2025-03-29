# Maintainer: laggykiller <chaudominic2 at gmail dot com>
pkgname=sticker-convert
pkgver=2.11.9
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
sha256sums_x86_64=('20a296bdfa8895d36dcb73b6d023c665fd0921989c92a1d7e9c6af770707260c'
                   '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643')
sha256sums_aarch64=('87b2cb3145c64358a19771518c33491698337d6f66ef1cb04f867d9eae9d9e38'
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
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

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
