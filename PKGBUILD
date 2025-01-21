# Maintainer: toedurag <toedurag at proton dot me>
# Contributor: Josh Baron (xriitox) <joshbaron48 at outlook dot com>
# Contributor: PopeRigby <poperigby at mailbox dot org>
# Contributor: Cassidy Wilson <cassidywilson at mailbox dot org>	

pkgname=doomrunner
pkgver=1.8.3
pkgrel=4
pkgdesc="Modern preset-oriented graphical launcher of ZDoom and derivatives"
arch=('x86_64')
url="https://github.com/Youda008/DoomRunner"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=('git' 'gcc')
backup=('opt/DoomRunner')
source=("DoomRunner-${pkgver}.tar.gz::https://github.com/Youda008/DoomRunner/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('8435eb4c5dc11e89437b905d7c89686e')

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
  cp "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.desktop" "${pkgdir}/usr/share/applications/DoomRunner.desktop"
  cp "${srcdir}/DoomRunner-${pkgver}/Install/XDG/io.github.Youda008.DoomRunner.appdata.xml" "${pkgdir}/usr/share/metainfo/io.github.Youda008.DoomRunner.appdata.xml"
    # Copy icon file
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps/"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/24x24/apps/"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/16x16/apps/"
	cp "${srcdir}/DoomRunner-${pkgver}/Resources/DoomRunner.ico" "${pkgdir}/usr/share/pixmaps/DoomRunner.ico"
  magick "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.128x128.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/128x128/apps/DoomRunner.png"
	magick "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.64x64.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/64x64/apps/DoomRunner.png"
	magick "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.48x48.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/DoomRunner.png"
	magick "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.32x32.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/32x32/apps/DoomRunner.png"
	magick "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.24x24.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/24x24/apps/DoomRunner.png"
	magick "${srcdir}/DoomRunner-${pkgver}/Install/XDG/DoomRunner.16x16.png" -strip -quality 100 "${pkgdir}/usr/share/icons/hicolor/16x16/apps/DoomRunner.png"

    # Install DoomRunner
	mkdir -p "${pkgdir}/usr/bin"
	cd "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
	make install INSTALL_ROOT="${pkgdir}/" 
}

