# Maintainer:     Cassidy Wilson <cassidywilson at mailbox dot org>	

pkgname=doomrunner
pkgver=1.3.3
pkgrel=1
pkgdesc="Modern preset-oriented graphical launcher of ZDoom and derivatives"
arch=('x86_64')
url="https://github.com/Youda008/DoomRunner"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
backup=('opt/DoomRunner')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Youda008/DoomRunner/archive/v${pkgver}.tar.gz")
md5sums=('2cbafa2be376257c165ec4fc0f4ba9eb')

build() {
	mkdir -p "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
	cd "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
	qmake ../DoomRunner.pro -spec linux-g++ "CONFIG+=release"
	make	
}

package() {
	cd "${srcdir}/DoomRunner-${pkgver}/build-dynamic"
	make install INSTALL_ROOT="${pkgdir}/" 
	mkdir -p "${pkgdir}/usr/bin"
	ln -sT "/opt/DoomRunner/bin/DoomRunner" "${pkgdir}/usr/bin/doomrunner"
	chmod 777 "${pkgdir}/opt/DoomRunner/bin"
	#TODO: Create desktop file
}

