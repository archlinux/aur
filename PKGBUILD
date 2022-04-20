# Maintainer: Matt Pharoah <mtpharoah@gmail.com>
pkgname=parallel-launcher
pkgver=6.4.0
pkgrel=1
epoch=
pkgdesc='A simple easy-to-use launcher for the ParallelN64 and Mupen64Plus-Next emulators'
arch=('x86_64')
url='https://parallel-launcher.ca'
license=('GPL3')
groups=()
depends=(
	'glibc'
	'libstdc++5'
	'gcc-libs'
	'qt5-base'
	'qt5-svg'
	'findutils'
	'xdg-utils'
	'flatpak'
	'polkit'
	'sqlite'
	'libgcrypt'
)
makedepends=(
	'gcc'
	'qt5-declarative'
	'make'
	'qt5-tools'
)
checkdepends=()
optdepends=(
	'noto-fonts: intended font'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='parallel-launcher.install'
changelog=
source=('https://gitlab.com/parallel-launcher/parallel-launcher/uploads/1cb7c4a8b1bbdc5bdaa7a6a5399541f0/parallel-launcher-6.4.0.tar.gz')
noextract=()
sha256sums=('7360100ef868ac65faa17e5c0beebc167968600dfebb3fbfc12372dde18e7cc2')
validpgpkeys=()

build() {
	qmake-qt5 "CONFIG+=precompiled-helpers" app.pro -spec linux-g++
	lrelease app.pro
	make -j `nproc`
}

package() {
	install -D parallel-launcher $pkgdir/usr/bin/parallel-launcher
	install -D parallel-launcher.desktop $pkgdir/usr/share/applications/parallel-launcher.desktop
	install -D data/appicon.svg $pkgdir/usr/share/parallel-launcher/appicon.svg
	install -D bps-mime.xml $pkgdir/usr/share/parallel-launcher/bps-mime.xml
	install -D lang/parallel-launcher.en_us.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.en_us.qm
	install -D lang/parallel-launcher.en_gb.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.en_gb.qm
	install -D lang/parallel-launcher.it.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.it.qm
	install -D lang/parallel-launcher.es.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.es.qm
	install -D lang/parallel-launcher.fr_ca.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.fr_ca.qm
	install -D lang/parallel-launcher.fr.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.fr.qm
	install -D lang/parallel-launcher.de.qm $pkgdir/usr/share/parallel-launcher/parallel-launcher.de.qm
}
