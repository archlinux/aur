# Maintainer: nikren <superdug000@gmail.com>
pkgname=anilinux-electron
pkgver=1.0.4
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
source=("https://github.com/Nikren2006/anilinux-electron/releases/download/v${pkgver}/anilinux_${pkgver}_amd64.deb")
sha256sums=('1b859247d573b63f74cb9c275d7b6d20d5a683ba64b368ea21628a22c21e73fe')

package() {
    tar -xf data.tar.xz --directory "${pkgdir}"

    mv "${pkgdir}/opt/Anilinux-electron" "${pkgdir}/opt/anilinux-electron"
    sed -i 's|/opt/Anilinux-electron|/opt/anilinux-electron|g' "${pkgdir}/usr/share/applications/anilinux.desktop"

    sed -i 's|Categories=Audio;|Categories=AudioVideo;Audio;|g' "${pkgdir}/usr/share/applications/anilinux.desktop"

    # Install symlink to binary
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/anilinux-electron/Anilinux-electron" "${pkgdir}/usr/bin/anilinux-electron"
}

