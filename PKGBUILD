# Maintainer: gspu <bssbk2455[at]gmail[dot]com>
# Contributor: Previous maintainer's ValHue <vhuelamo at gmail dot com>

pkgname="thunar-megasync"
pkgver="3.6.5.0"
pkgrel="1"
pkgdesc="Upload your files to your Mega account from Thunar."
arch=('i686' 'x86_64')
url="https://mega.nz/sync"
license=('MEGA LIMITED CODE REVIEW LICENCE')
depends=('megasync' 'thunar')
provides=("${pkgname}")

source=("https://github.com/meganz/MEGAsync/archive/v${pkgver}_Linux.zip")
sha256sums=('4ead2b5e9a9a7eae96fd9e1a072a5f1bca4552c21e601ea485d5546d882613db')

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
