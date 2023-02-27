# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=ogui-bin
_pkgbase=opengamepadui
pkgver=v0.1.0
pkgrel=1
pkgdesc="Open source game launcher"
arch=('x86_64')
url="https://github.com/ShadowBlip/OpenGamepadUI"
license=('GPL')
depends=('glibc' 'gcc-libs' 'libx11' 'libxres' 'libxcb' 'libxext' 'libxau'
	 'libxdmcp' 'gamescope' 'ryzenadj-git'
	 )
provides=('ogui')
source=(opengamepadui.tar.gz::https://github.com/ShadowBlip/OpenGamepadUI/releases/download/$pkgver/opengamepadui.tar.gz)

sha256sums=('76610c15f86e070e6f22d9f0e4f4a97ca19981fb69fb0cc138011a741ed7d54c')

prepare() {
	cd "$srcdir/${_pkgbase}"
}

package() {
	options=('!strip')
	cd "$srcdir/${_pkgbase}"

	mkdir -p ${pkgdir}/etc/handypt
	install -Dm755 etc/handypt/powertools ${pkgdir}/etc/handypt
	
	mkdir -p ${pkgdir}/usr/bin
	install -Dm755 usr/bin/opengamepadui ${pkgdir}/usr/bin

	mkdir -p ${pkgdir}/usr/lib/systemd/user
	install -Dm644 usr/lib/systemd/user/ogui-qam.service ${pkgdir}/usr/lib/systemd/user
	
	mkdir -p ${pkgdir}/usr/share/opengamepadui
	install -Dm644 usr/share/opengamepadui//libevdev.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libevdev.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/libpty.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libpty.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/libxlib.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libxlib.linux.template_debug.x86_64.so
	install -Dm755 usr/share/opengamepadui/opengamepad-ui.x86_64 ${pkgdir}/usr/share/opengamepadui/opengamepad-ui.x86_64
	
	mkdir -p ${pkgdir}/usr/share/polkit-1/actions
	install -Dm644 usr/share/polkit-1/actions/org.shadowblip.powertools.policy ${pkgdir}/usr/share/polkit-1/actions
}
