# Maintainer: nikren <superdug000@gmail.com>
pkgname=anilinux-electron
pkgver=1.0.2
pkgrel=7
pkgdesc="Anime viewer for Linux with Shikimori OAuth integration"
arch=('x86_64')
url="https://github.com/Nikren2006/anilinux-electron"
license=('MIT')
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
    mpv
)
optdepends=(
    libappindicator-gtk3
)
options=('!strip')
source=("https://github.com/Nikren2006/anilinux-electron/releases/download/v${pkgver}/anilinux_${pkgver}_amd64.deb")
sha256sums=('593cf8c5d5f4e8c3a4971f3780eaaad1db0ff9bd16e9adb40d0855ae5f200d9e')

package() {
    tar -xf data.tar.xz --directory "${pkgdir}"

    mv "${pkgdir}/opt/АниЛинукс" "${pkgdir}/opt/anilinux-electron"
    sed -i 's|/opt/АниЛинукс|/opt/anilinux-electron|g' "${pkgdir}/usr/share/applications/anilinux-electron.desktop"

    sed -i 's|Categories=Audio;|Categories=AudioVideo;Audio;|g' "${pkgdir}/usr/share/applications/anilinux-electron.desktop"

    # Install symlink to binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/anilinux-electron/anilinux-electron" "${pkgdir}/usr/bin/anilinux-electron"
}

# Maintainer: dmitrysvd
#
#pkgname=yandex-music
#pkgver=5.97.3
#pkgrel=1
#pkgdesc="Official Yandex Music App for Linux"
#arch=('x86_64')
#url="https://music.yandex.ru/download/"
#license=('unknown')
#depends=(
#    gtk3
#    libnotify
#    nss
#    libxss
#    libxtst
#    xdg-utils
#    at-spi2-core
#    util-linux-libs
#    libsecret
#)
#optdepends=(
#    libappindicator-gtk3
#)
#options=('!strip')
#source=("https://music-desktop-application.s3.yandex.net/stable/Yandex_Music_amd64_${pkgver}.deb")
#sha256sums=('699201a71c487dd0626c41954229605435b476486a736bdb81d2b71834848179')
#
#package() {
#    tar -xf data.tar.xz --directory "${pkgdir}"
#
#    # Remove Cyrillic from the path
#    mv "${pkgdir}/opt/Яндекс Музыка" "${pkgdir}/opt/yandex-music"
#    sed -i 's|/opt/Яндекс Музыка|/opt/yandex-music|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"
#
#    # Fix menu category
#    sed -i 's|Categories=Audio;|Categories=AudioVideo;Audio;|g' "${pkgdir}/usr/share/applications/yandexmusic.desktop"
#
#    # Fix GTK version error for Gnome users
#    sed -i 's|Exec="/opt/yandex-music/yandexmusic"|Exec="/opt/yandex-music/yandexmusic" --gtk-version=3|' "${pkgdir}/usr/share/applications/yandexmusic.desktop"
#}
