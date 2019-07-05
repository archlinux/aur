# Maintainer: Schwonder Reismus <schw0reismus@protonmail.com>
# Contributor: Previous maintainer ValHue <vhuelamo@gmail.com>
# Contributor: Original maintainer gspu <bssbk2455@gmail.com>

pkgname="thunar-gtk3-megasync"
pkgver="4.2.0"
pkgrel="2"
pkgdesc="Upload your files to your Mega account from Thunar (revision for GTK3)."
arch=('i686' 'x86_64')
url="https://mega.nz/sync"
license=('MEGA LIMITED CODE REVIEW LICENCE')
depends=('megasync' 'thunar>=1.8.0')
provides=("${pkgname}")
conflicts=("thunar-megasync")
replaces=("thunar-megasync")

source=('git+https://github.com/schw0reismus/MEGAsync.git')
sha256sums=('SKIP')

build() {
	cd "MEGAsync/src/MEGAShellExtThunar"
	qmake MEGAShellExtThunar.pro
    make
}

package() {
	cd "MEGAsync/src/MEGAShellExtThunar"
	install -dm 755 ${pkgdir}/usr/lib/thunarx-3/
	install -m 644 libMEGAShellExtThunar.so.1.0.0 ${pkgdir}/usr/lib/thunarx-3/
	
	cd "${pkgdir}/usr/lib/thunarx-3"
	ln -f -s libMEGAShellExtThunar.so.1.0.0 libMEGAShellExtThunar.so.1.0
	ln -f -s libMEGAShellExtThunar.so.1.0.0 libMEGAShellExtThunar.so.1
	ln -f -s libMEGAShellExtThunar.so.1.0.0 libMEGAShellExtThunar.so
}

# vim:set ts=4 sw=2 ft=sh et:
