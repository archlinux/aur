# Maintainer: Yarok
# contributor: dmitrysvd
pkgname=yandex-music-beta
pkgver=5.106.2
pkgrel=1
pkgdesc="Official Yandex Music App for Linux (beta release)"
arch=('x86_64')
url="https://music.yandex.ru/download/"
license=('proprietary')
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
sha256sums=('fadbbdc81dca1aecf1cef3b332060dac06fc17833d74be273e7b59b9f746d980')

package() {
    tar -xf data.tar.xz --directory "${pkgdir}"

    # Remove Cyrillic from the path
    mv "${pkgdir}/opt/Яндекс Музыка" "${pkgdir}/opt/yandex-music"
    local_desktop="${pkgdir}/usr/share/applications/yandexmusic.desktop"

    sed -i -e 's|/opt/Яндекс Музыка|/opt/yandex-music|g' \
           -e 's|Categories=Audio;|Categories=AudioVideo;Audio;|g' \
           -e 's|Exec="/opt/yandex-music/yandexmusic"|Exec="/opt/yandex-music/yandexmusic" --gtk-version=3|' \
           "$local_desktop"
}
