#!/usr/bin/env bash
# Maintainer: Underports Software
# Contributor: Aleksey Sh aur <at> pivko.codes
pkgname=meridius-electron-bin
pkgver=1.9.1
pkgrel=1
epoch=1
arch=('x86_64')
url="https://purplehorrorrus.github.io/meridius"
license=('proprietary')
source=(https://github.com/PurpleHorrorRus/Meridius/releases/download/v${pkgver}/meridius-${pkgver}.deb)
sha512sums=('bc4d9a8dc411b2bebce65eef58fe9ac698eb2c18a7a85b515c6956bc496485472bbf9f01c10970fc925f75bbf666ef501cf1dc73ef57bfe881ca773c2821e623')

package_meridius-electron-bin() {

    depends=('electron' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libappindicator-gtk3' 'libsecret')
    arch=('x86_64')
    pkgdesc="Music Player for vk.com based on Electron, NuxtJS, Vue. (System Electron)"
    provides=('meridius')

        mkdir -p ${pkgdir}/usr/share/Meridius
        mkdir -p ${pkgdir}/usr/share/icons/hicolor/256x256/apps
        mkdir -p ${pkgdir}/usr/share/applications

            bsdtar -xvf data.tar.xz ./opt/Meridius/resources/app.asar ./usr/share/applications/meridiusreborn.desktop ./usr/share/icons/hicolor/256x256/apps/meridiusreborn.png
            bsdtar -xf data.tar.xz -C "$pkgdir"

        sed -i 's!/opt/Meridius/meridiusreborn!electron /usr/share/Meridius/app.asar!' usr/share/applications/meridiusreborn.desktop
        sed -i 's!Audio;!Audio;Music;Player;AudioVideo;!' usr/share/applications/meridiusreborn.desktop

        mv usr/share/icons/hicolor/256x256/apps/meridiusreborn.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps
        mv usr/share/applications/meridiusreborn.desktop ${pkgdir}/usr/share/applications
        mv opt/Meridius/resources/app.asar ${pkgdir}/usr/share/Meridius

}
