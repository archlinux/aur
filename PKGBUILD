# Maintainer: dmitrysvd

pkgname=yandex-music
pkgver=5.78.7
pkgrel=1
pkgdesc="Official Yandex Music App for Linux"
arch=('x86_64')
url="https://music.yandex.ru/download/"
license=('unknown')
depends=(
    gtk3
    libnotify
    nss
    libxss
    libxtst
    xdg-utils
    at-spi2-core
    util-linux-libs
    libsecret
)
optdepends=(
    libappindicator-gtk3
)
options=('!strip')
source=("https://music-desktop-application.s3.yandex.net/stable/Yandex_Music_amd64_${pkgver}.deb")
sha256sums=('d91db300c6f92af3a3bb21ea6bd2b0e80d0bff390c18d9e63b1374fc8a7a6eaf')

package() {
    tar -xf data.tar.xz --directory "${pkgdir}"

    # Remove Cyrillic from the path
    mv "${pkgdir}/opt/Яндекс Музыка" "${pkgdir}/opt/yandex-music"
    sed -i 's|/opt/Яндекс Музыка|/opt/yandex-music|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

    # Fix menu category
    sed -i 's|Categories=Audio;|Categories=AudioVideo;Audio;|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"

    # Fix GTK version error for Gnome users
    sed -i 's|Exec="/opt/yandex-music/yandexmusic"|Exec="/opt/yandex-music/yandexmusic" --gtk-version=3|' "${pkgdir}/usr/share/applications/yandexmusic.desktop"
}
