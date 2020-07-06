# Maintainer: Kaleb Klein <klein.jae@gmail.com>

pkgname=swgemu
pkgver=0.23
pkgrel=6
pkgdesc="Launcher for Star Wars Galaxies Emulator"
arch=(any)
license=('GPL')
url="http://www.swgemu.com"
_srcurl=https://review.swgemu.com/p/Launchpad.git
_dlurl=http://launchpad2.net/SWGEmuLaunchpad_ubuntu_x86_64.tar.gz
depends=('qt5-base'
         'qt5-webkit')
source=(launchpad launchpad.desktop launchpad.install
		icon.png removeicon.patch ${_dlurl} Launchpad::git+${_srcurl})
validpgpkeys=(120206848BD3375043BF1B253209FA22E33FF70C)
sha256sums=('b25d19e4b20d41e640f4adef0d8cb54e7fdd713bb36b9c7adc0a9d8b03bd8bd9'
            '1f46fe25911879b3ead1349f0f66b85adaa4974542db6a1e268d4343278f2ce4'
            'af45f7c63e2eb89c42355731db15ae92dbfbeb274283d4d57cd29e9a46a132aa'
            '1b7e5ef6fcd387f7b10ce88abb78dc89e6368b53aaf8a23acfef05652ea20e97'
            '0376bb4d77b13719177f166537ad105fcd01f0947ff96d1f9bde53d09ebd760c'
            'ec30edbee4b3563f7d7a75c1e35e8b68792eb80c9b313d9982cedcf0e83d5455'
            'SKIP')
install='launchpad.install'

prepare() {
	cd "$srcdir/Launchpad"
	patch -Np1 -i ../removeicon.patch
}

build() {
	cd "$srcdir/Launchpad"
	qmake-qt5 SWGEmuLaunchpad.pro
	make
}

package() {
    echo "package"

    install -D -m755 "${srcdir}/launchpad" "${pkgdir}/usr/bin/swgemu"
    install -D -m644 "${srcdir}/ubuntu64/KSWGProfCalc.dat" "${pkgdir}/opt/SWGEMU/Launchpad/KSWGProfCalc.dat"
    install -D -m644 "${srcdir}/ubuntu64/KSWGProfCalcEditor.exe" "${pkgdir}/opt/SWGEMU/Launchpad/KSWGProfCalcEditor.exe"
	install -D -m644 "${srcdir}/Launchpad/SWGEmuLaunchpad" "${pkgdir}/opt/SWGEMU/Launchpad/SWGEmuLaunchpad"
    chmod +x "${pkgdir}/opt/SWGEMU/Launchpad/SWGEmuLaunchpad"

    install -D -m644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/SWGEMU/icon.png"
    install -D -m644 "${srcdir}/launchpad.desktop" "${pkgdir}/usr/share/applications/launchpad.desktop"
}
