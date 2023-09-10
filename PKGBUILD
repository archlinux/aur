# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=opengamepadui-bin
_pkgbase=opengamepadui
pkgver=v0.21.7
pkgrel=1
pkgdesc="Open source game launcher"
arch=('x86_64')
url="https://github.com/ShadowBlip/OpenGamepadUI"
license=('GPL')
depends=('glibc' 'gcc-libs' 'libx11' 'libxres' 'libxcb' 'libxext' 'libxau'
	 'libxdmcp' 'gamescope' 'ryzenadj-git' 'networkmanager'
	 )
optdepends=('firejail' 'bubblewrap' 'wireplumber')
provides=('opengamepadui')
conflicts=('opengamepadui-git')
source=(opengamepadui-$pkgver.tar.gz::https://github.com/ShadowBlip/OpenGamepadUI/releases/download/$pkgver/opengamepadui.tar.gz)

sha256sums=('3b138458a4e00ef2a97029a6e200c03951c633d4588664d0b6f0d616604a7c12')

prepare() {
	cd "$srcdir/${_pkgbase}"
}

package() {
	options=('!strip')
	cd "$srcdir/${_pkgbase}"

	
	mkdir -p ${pkgdir}/usr/bin
	install -Dm755 usr/bin/opengamepadui ${pkgdir}/usr/bin

	mkdir -p ${pkgdir}/usr/lib/systemd/user
	install -Dm644 usr/lib/systemd/user/ogui-qam.service ${pkgdir}/usr/lib/systemd/user

	mkdir -p ${pkgdir}/usr/lib/udev/hwdb.d
	install -Dm644 usr/lib/udev/hwdb.d/59-opengamepadui-handheld.hwdb ${pkgdir}/usr/lib/udev/hwdb.d/59-opengamepadui-handheld.hwdb

	mkdir -p ${pkgdir}/usr/lib/udev/rules.d
	install -Dm644 usr/lib/udev/rules.d/61-opengamepadui-handheld.rules ${pkgdir}/usr/lib/udev/rules.d/61-opengamepadui-handheld.rules
	
	mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable/apps
	install -Dm444 usr/share/icons/hicolor/scalable/apps/opengamepadui.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/opengamepadui.svg
	
	mkdir -p ${pkgdir}/usr/share/opengamepadui/scripts
	install -Dm644 usr/share/opengamepadui/libevdev.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libevdev.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/libopensd.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libopensd.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/libpty.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libpty.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/libxlib.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libxlib.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/libunixsock.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libunixsock.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/libdbus.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/libdbus.linux.template_debug.x86_64.so
	install -Dm644 usr/share/opengamepadui/liblinuxthread.linux.template_debug.x86_64.so ${pkgdir}/usr/share/opengamepadui/liblinuxthread.linux.template_debug.x86_64.so
	install -Dm755 usr/share/opengamepadui/opengamepad-ui.x86_64 ${pkgdir}/usr/share/opengamepadui/opengamepad-ui.x86_64
	install -Dm755 usr/share/opengamepadui/scripts/powertools ${pkgdir}/usr/share/opengamepadui/scripts/powertools
	install -Dm755 usr/share/opengamepadui/scripts/manage_input ${pkgdir}/usr/share/opengamepadui/scripts/manage_input
	install -Dm755 usr/share/opengamepadui/scripts/make_nice ${pkgdir}/usr/share/opengamepadui/scripts/make_nice
	install -Dm755 usr/share/opengamepadui/scripts/system_profiler.py ${pkgdir}/usr/share/opengamepadui/scripts/system_profiler.py
	setcap 'cap_sys_nice=eip' "${pkgdir}/usr/share/opengamepadui/opengamepad-ui.x86_64"
	
	mkdir -p ${pkgdir}/usr/share/polkit-1/actions
	install -Dm644 usr/share/polkit-1/actions/org.shadowblip.powertools.policy ${pkgdir}/usr/share/polkit-1/actions/org.shadowblip.powertools.policy
	install -Dm644 usr/share/polkit-1/actions/org.shadowblip.manage_input.policy ${pkgdir}/usr/share/polkit-1/actions/org.shadowblip.manage_input.policy
	install -Dm644 usr/share/polkit-1/actions/org.shadowblip.setcap.policy ${pkgdir}/usr/share/polkit-1/actions/org.shadowblip.setcap.policy
}

