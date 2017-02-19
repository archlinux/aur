# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="thunar-megasync"
pkgver="3.0.1.0"
pkgrel="1"
pkgdesc="Upload your files to your Mega account from Thunar."
arch=('i686' 'x86_64')
url="https://mega.co.nz/#sync"
license=('custom:The Clarified Artistic License')
depends=('megasync' 'thunar')
provides=("${pkgname}")

source=("https://github.com/meganz/MEGAsync/archive/v${pkgver}_Linux.zip")
sha256sums=('88d5cd14cb4157f4593b005cb7ce37022d1f1d3b5d79eb5362f210ece7031fb8')

build() {
	cd "MEGAsync-${pkgver}_Linux/src/MEGAShellExtThunar"
    qmake-qt4 MEGAShellExtThunar.pro
    make
}

package() {
	cd "MEGAsync-${pkgver}_Linux/src/MEGAShellExtThunar"
	install -dm 755 ${pkgdir}/usr/lib/thunarx-2/
	install -m 644 libMEGAShellExtThunar.so.1.0.0 ${pkgdir}/usr/lib/thunarx-2/
	
	cd "${pkgdir}/usr/lib/thunarx-2"
	ln -f -s libMEGAShellExtThunar.so.1.0.0 libMEGAShellExtThunar.so.1.0
	ln -f -s libMEGAShellExtThunar.so.1.0.0 libMEGAShellExtThunar.so.1
	ln -f -s libMEGAShellExtThunar.so.1.0.0 libMEGAShellExtThunar.so
}

# vim:set ts=4 sw=2 ft=sh et:
