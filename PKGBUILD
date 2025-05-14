# Maintainer: Rafayet Hossain (rafayet-arch) <rafayet at hos dot sh>
# Contributor: Josh Baron (xriitox) <joshbaron48 at outlook dot com>
# Contributor: PopeRigby <poperigby at mailbox dot org>
# Contributor: Cassidy Wilson <cassidywilson at mailbox dot org>	

pkgname=doomrunner
pkgver=1.9.1
pkgrel=2
pkgdesc="Modern preset-oriented graphical launcher of ZDoom and derivatives"
arch=('x86_64')
url="https://github.com/Youda008/DoomRunner"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=('git' 'gcc')
backup=('opt/DoomRunner')
source=("DoomRunner-${pkgver}.tar.gz::https://github.com/Youda008/DoomRunner/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('94184e01b174c95aba3a908a0069ec24')

build() {
    mkdir -p "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
    cd "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
    qmake6 ../DoomRunner.pro -spec linux-g++ "CONFIG+=release"
    make	
}

package() {
    # Copy desktop file
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/metainfo"
    install -Dm644 "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.desktop" "${pkgdir}/usr/share/applications/DoomRunner.desktop"
    install -Dm644 "${srcdir}/DoomRunner-${pkgver}/Install/XDG/io.github.Youda008.DoomRunner.appdata.xml" "${pkgdir}/usr/share/metainfo/io.github.Youda008.DoomRunner.appdata.xml"
    # Copy icon file
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    install -Dm644 "${srcdir}/DoomRunner-${pkgver}/Resources/DoomRunner.ico" "${pkgdir}/usr/share/pixmaps/DoomRunner.ico"

    mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/24x24/apps/"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/16x16/apps/"
    install -Dm644 "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/DoomRunner.png"
    install -Dm644 "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/DoomRunner.png"
    install -Dm644 "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/DoomRunner.png"
    install -Dm644 "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/DoomRunner.png"
    install -Dm644 "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.24x24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/DoomRunner.png"
    install -Dm644 "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.16x16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/DoomRunner.png"

    # Install DoomRunner
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
    make install INSTALL_ROOT="${pkgdir}/" 
}

