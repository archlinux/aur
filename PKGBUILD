# Maintainer:     Cassidy Wilson <cassidywilson at mailbox dot org>	

pkgname=doomrunner
pkgver=1.6
pkgrel=1
pkgdesc="Modern preset-oriented graphical launcher of ZDoom and derivatives"
arch=('x86_64')
url="https://github.com/Youda008/DoomRunner"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
backup=('opt/DoomRunner')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Youda008/DoomRunner/archive/v${pkgver}.tar.gz")
md5sums=('c491f9cded1a782a50880d952cf999ef')

build() {
	mkdir -p "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
	cd "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
	qmake ../DoomRunner.pro -spec linux-g++ "CONFIG+=release"
	make	
}

package() {
    # Copy desktop file
	mkdir -p "${pkgdir}/usr/share/applications"
	cp "${srcdir}/DoomRunner-${pkgver}/DoomRunner.desktop" "${pkgdir}/usr/share/applications"
    # Copy icon file
	mkdir -p "${pkgdir}/usr/share/icons"
	cp "${srcdir}/DoomRunner-${pkgver}/Resources/DoomRunner.ico" "${pkgdir}/usr/share/icons/doomrunner.ico"
    # Install DoomRunner
	cd "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
	make install INSTALL_ROOT="${pkgdir}/" 
	mkdir -p "${pkgdir}/usr/bin"
	ln -sT "/opt/DoomRunner/bin/DoomRunner" "${pkgdir}/usr/bin/doomrunner"
}

