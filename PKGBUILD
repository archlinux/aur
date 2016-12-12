# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="thunar-megasync"
pkgver="2.9.2"
pkgrel="1"
pkgdesc="Upload your files to your Mega account from Thunar."
arch=('i686' 'x86_64')
url="https://mega.co.nz/#sync"
license=('custom:The Clarified Artistic License')
depends=('megasync' 'thunar')
provides=("${pkgname}")

source=("https://github.com/meganz/MEGAsync/archive/master.zip")
sha256sums=('2208cd8cb8a6908843ec38b7510858cabed4c0b54f9fd7cac8c65e7652ed316d')

build() {
	cd "MEGAsync-master/src/MEGAShellExtThunar"
    qmake-qt4 MEGAShellExtThunar.pro
    make
}

package() {
	cd "MEGAsync-master/src/MEGAShellExtThunar"
	install -dm 755 ${pkgdir}/usr/lib/thunarx-2/
	install -m 644 libMEGAShellExtThunar.so.1.0.0 ${pkgdir}/usr/lib/thunarx-2/
	
	cd "${pkgdir}/usr/lib/thunarx-2"
	ln -f -s libMEGAShellExtThunar.so.1.0.0 libMEGAShellExtThunar.so.1.0
	ln -f -s libMEGAShellExtThunar.so.1.0.0 libMEGAShellExtThunar.so.1
	ln -f -s libMEGAShellExtThunar.so.1.0.0 libMEGAShellExtThunar.so
}

# vim:set ts=4 sw=2 ft=sh et: