# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=('keyboard-configurator')
pkgbase=keyboard-configurator
pkgver=1.0.0
pkgrel=1
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
makedepends=('gtk3' 'rust' 'systemd')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96d2afd18641c66be6503283a5d90afd6737de1f14d4425f1a2e45057411043c')

build() {
	cd "$pkgbase-$pkgver"
	make prefix=/usr
}

package_keyboard-configurator() {
	pkgdesc="System76 GUI for managing keyboards"
	depends=('xz' 'hidapi' 'gtk3')

	cd "$pkgbase-$pkgver"
	install -Dm755 target/release/system76-keyboard-configurator "$pkgdir"/usr/bin/system76-keyboard-configurator
	install -Dm644 linux/com.system76.keyboardconfigurator.desktop "$pkgdir"/usr/share/applications/com.system76.keyboardconfigurator.desktop
	install -Dm644 linux/com.system76.keyboardconfigurator.appdata.xml "$pkgdir"/usr/share/metainfo/com.system76.keyboardconfigurator.appdata.xml
	install -Dm644 data/icons/scalable/apps/com.system76.keyboardconfigurator.svg "$pkgdir"/usr/share/icons/com.system76.keyboardconfigurator.svg
	install -Dm644 debian/com.system76.pkexec.keyboardconfigurator.policy "$pkgdir"/usr/share/polkit-1/actions/com.system76.pkexec.keyboardconfigurator.policy
	make prefix=/usr DESTDIR="$pkgdir/" install
}

