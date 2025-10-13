# Maintainer: dmitrysvd
pkgname=yandex-music-native
pkgver=5.72.5
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
sha256sums=('d1cbe699974929e535e4880bc156f4adb89d47f6ec25b578d073827b437dd214')

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
