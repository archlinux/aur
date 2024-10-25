# Maintainer: Simon Keimer <dc0sk at secure dot mailbox dot org>
pkgname=antscope2-git
pkgver=1.2.6
pkgrel=3
epoch=0
pkgdesc="The AntScope2 software is designed to support various models of RigExpert antenna analyzers under various operating systems. It is commonly used in the hamradio community. Based os Qt5."
arch=('x86_64' 'i686')
url="https://github.com/rigexpert/AntScope2"
license=('MIT')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/rigexpert/AntScope2.git#commit=19323af9b8157dff4c260f516d8bda4b05e6a8a9"
		"99-rigexpert.rules"
		"antscope2.desktop")
noextract=()
sha256sums=('SKIP'
			'SKIP'
			'SKIP')
validpgpkeys=()

build() {
	cd ${srcdir}/${pkgname}
	qmake
	make
}
check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "${srcdir}/${pkgname}/build/release"
#	install -Dm755 AntScope2 $pkgdir/usr/bin/AntScope2


	install -Dm755 AntScope2 "${pkgdir}/usr/bin/AntScope2"
#	[ -L "${pkgdir}"/usr/bin/AntScope2 ] || ln -s "${pkgdir}/usr/share/antscope2/AntScope2 ${pkgdir}/usr/local/bin/AntScope2"

	cd "${srcdir}/${pkgname}"
	[ -d "${pkgdir}"/usr/share/antscope2/Resources ] || mkdir -p "${pkgdir}"/usr/share/antscope2/Resources
	install -Dm644 cables.txt "${pkgdir}"/usr/share/antscope2/Resources/cables.txt
	install -Dm644 itu-regions.txt "${pkgdir}"usr/share/antscope2/Resources/itu-regions.txt
	install -Dm644 itu-regions-defaults.txt "${pkgdir}"/usr/share/antscope2/Resources/itu-regions-defaults.txt
	install -Dm644 Calibration/cal_load.s1p "${pkgdir}"/usr/share/antscope2/cal_load.s1p
	install -Dm644 Calibration/cal_open.s1p "${pkgdir}"/usr/share/antscope2/cal_open.s1p
	install -Dm644 Calibration/cal_short.s1p "${pkgdir}"/usr/share/antscope2/cal_short.s1p

	[ -d "${pkgdir}"/usr/share/antscope2/icons ] || mkdir -p "${pkgdir}"/usr/share/antscope2/icons
	install -Dm644 AntScope2.icns "${pkgdir}"/usr/share/antscope2/icons/AntScope2.icns
	install -Dm644 AntScope2.ico "${pkgdir}"/usr/share/antscope2/icons/AntScope2.ico
	install -Dm644 AntScope2.png "${pkgdir}"/usr/share/antscope2/icons/AntScope2.png

	install -Dm644 LICENSE.txt "${pkgdir}"/usr/local/share/antscope2/LICENSE.txt

	cd "${srcdir}"
	install -Dm644 99-rigexpert.rules "${pkgdir}"/etc/udev/rules.d/99-rigexpert.rules
	install -Dm644 antscope2.desktop "${pkgdir}"/usr/share/applications/antscope2.desktop


}
