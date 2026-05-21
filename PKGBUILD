# Maintainer: Yarok
# contributor: dmitrysvd
pkgname=yandex-music-beta
pkgver=5.103.2
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
sha256sums=('9e751a3589e2042456061c4cb942cd9942b4891095f5dbae49d24b3d8c2f8253')

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
sha256sums=('48a7c9c09aa5be8c6346ccdda73991ff0d97a354bedb89a46a4140543e6dbd7b')
