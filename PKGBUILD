# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=('keyboard-configurator')
pkgbase=keyboard-configurator
pkgver=1.0.0
pkgrel=1
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
makedepends=('atk' 'at-spi2-atk' 'at-spi2-core' 'base' 'cairo' 'dbus' 'expat' 'fontconfig' 'freetype2' 'fribidi' 'gdk-pixbuf2' 'glib2' 'graphite' 'gtk3' 'harfbuzz' 'hidapi' 'libcap' 'libcloudproviders' 'libdatrie' 'libepoxy' 'libffi' 'libgcrypt' 'libgpg-error' 'libjpeg-turbo' 'libpng' 'libxrender' 'libthai' 'libtiff' 'libx11' 'libxau' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxrandr' 'lz4' 'pango' 'pcre' 'pixman' 'rust' 'systemd-libs' 'util-linux-libs' 'wayland' 'xz' 'zlib' 'zstd')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('96d2afd18641c66be6503283a5d90afd6737de1f14d4425f1a2e45057411043c')

build() {
	cd "$pkgbase-$pkgver"
	make prefix=/usr
}

package_keyboard-configurator() {
	pkgdesc="System76 GUI for managing keyboards"
	depends=('xz' 'hidapi')

	cd "$pkgbase-$pkgver"
	install -Dm755 target/release/system76-keyboard-configurator "$pkgdir"/usr/bin/system76-keyboard-configurator
	install -Dm644 linux/com.system76.keyboardconfigurator.desktop "$pkgdir"/usr/share/applications/com.system76.keyboardconfigurator.desktop
	install -Dm644 linux/com.system76.keyboardconfigurator.appdata.xml "$pkgdir"/usr/share/metainfo/com.system76.keyboardconfigurator.appdata.xml
	install -Dm644 data/icons/scalable/apps/com.system76.keyboardconfigurator.svg "$pkgdir"/usr/share/icons/com.system76.keyboardconfigurator.svg
	install -Dm644 debian/com.system76.pkexec.keyboardconfigurator.policy "$pkgdir"/usr/share/polkit-1/actions/com.system76.pkexec.keyboardconfigurator.policy
}

