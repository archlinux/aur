# Maintainer: gspu <bssbk2455[at]gmail[dot]com>
# Contributor: Previous maintainer ValHue <vhuelamo at gmail dot com>

pkgname="thunar-megasync"
pkgver="3.6.6.0"
pkgrel="1"
pkgdesc="Upload your files to your Mega account from Thunar."
arch=('i686' 'x86_64')
url="https://mega.nz/sync"
license=('MEGA LIMITED CODE REVIEW LICENCE')
depends=('megasync' 'thunar')
provides=("${pkgname}")

source=("https://github.com/meganz/MEGAsync/archive/v${pkgver}_Linux.tar.gz")
sha256sums=('377a0b77b2506ebe0052d6366c3b5b74c3012cb4938e4df5e4b003677073f5fa')

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
