# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=('keyboard-configurator')
pkgbase=keyboard-configurator
pkgver=0.2.10
pkgrel=1
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
makedepends=('atk' 'at-spi2-atk' 'at-spi2-core' 'base' 'cairo' 'dbus' 'expat' 'fontconfig' 'freetype2' 'fribidi' 'gdk-pixbuf2' 'glib2' 'graphite' 'gtk3' 'harfbuzz' 'hidapi' 'libcap' 'libcloudproviders' 'libdatrie' 'libepoxy' 'libffi' 'libgcrypt' 'libgpg-error' 'libjpeg-turbo' 'libpng' 'libxrender' 'libthai' 'libtiff' 'libx11' 'libxau' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxrandr' 'lz4' 'pango' 'pcre' 'pixman' 'rust' 'systemd-libs' 'util-linux-libs' 'wayland' 'xz' 'zlib' 'zstd')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-beta.tar.gz")
sha256sums=('619caa5f2975a8b6d33c7f780f1ade5e6cc4b7542ae15e4b2ee049d9d0d6b1a7')

build() {
	cd "$pkgbase-$pkgver-beta"
	make prefix=/usr
}

package_keyboard-configurator() {
	pkgdesc="System76 GUI for managing keyboards"
	depends=('xz' 'hidapi')

	cd "$pkgbase-$pkgver-beta"
	install -Dm755 target/release/system76-keyboard-configurator "$pkgdir"/usr/bin/system76-keyboard-configurator
	install -Dm644 linux/com.system76.keyboardconfigurator.desktop "$pkgdir"/usr/share/applications/com.system76.keyboardconfigurator.desktop
	install -Dm644 linux/com.system76.keyboardconfigurator.appdata.xml "$pkgdir"/usr/share/metainfo/com.system76.keyboardconfigurator.appdata.xml
	install -Dm644 data/icons/scalable/apps/com.system76.keyboardconfigurator.svg "$pkgdir"/usr/share/icons/com.system76.keyboardconfigurator.svg
	install -Dm644 debian/com.system76.pkexec.keyboardconfigurator.policy "$pkgdir"/usr/share/polkit-1/actions/com.system76.pkexec.keyboardconfigurator.policy
}

