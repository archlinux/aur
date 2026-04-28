# Maintainer: nikren <superdug000@gmail.com>
pkgname=anilinux-electron
pkgver=1.0.2
pkgrel=1
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
source=("https://github.com/Nikren2006/anilinux-electron/releases/download/v${pkgver}/anilinux-electron_${pkgver}_amd64.deb")
sha256sums=('')

package() {
    tar -xf data.tar.xz --directory "${pkgdir}"
}

# Maintainer: dmitrysvd

pkgname=yandex-music
pkgver=5.97.3
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
sha256sums=('699201a71c487dd0626c41954229605435b476486a736bdb81d2b71834848179')

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
