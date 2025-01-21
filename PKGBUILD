# Maintainer: toedurag <toedurag at proton dot me>
# Contributor: Josh Baron (xriitox) <joshbaron48 at outlook dot com>
# Contributor: PopeRigby <poperigby at mailbox dot org>
# Contributor: Cassidy Wilson <cassidywilson at mailbox dot org>	

pkgname=doomrunner
pkgver=1.8.3
pkgrel=3
pkgdesc="Modern preset-oriented graphical launcher of ZDoom and derivatives"
arch=('x86_64')
url="https://github.com/Youda008/DoomRunner"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=('git' 'gcc')
backup=('opt/DoomRunner')
source=("DoomRunner-${pkgver}.tar.gz::https://github.com/Youda008/DoomRunner/archive/refs/tags/v${pkgver}.tar.gz"
        "DoomRunner.desktop")
md5sums=('8435eb4c5dc11e89437b905d7c89686e'
         '6349d9f0210d971996475118180fb2f6')

build() {
	mkdir -p "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
	cd "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
	qmake6 ../DoomRunner.pro -spec linux-g++ "CONFIG+=release"
	make	
}

package() {
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/bin"

    # Copy desktop file
  cp "${srcdir}/DoomRunner.desktop" "${pkgdir}/usr/share/applications/DoomRunner.desktop"
    # Copy icon file
	cp "${srcdir}/DoomRunner-${pkgver}/Resources/DoomRunner.ico" "${pkgdir}/usr/share/pixmaps/DoomRunner.ico"
    # Install DoomRunner
	cd "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
	make install INSTALL_ROOT="${pkgdir}/" 
}

