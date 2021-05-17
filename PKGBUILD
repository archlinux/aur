# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=('keyboard-configurator')
pkgbase=keyboard-configurator
pkgver=0.2.7
pkgrel=1
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
makedepends=('atk' 'at-spi2-atk' 'at-spi2-core' 'bzip2' 'cairo' 'dbus' 'expat' 'fontconfig' 'freetype2' 'fribidi' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'graphite' 'gtk3' 'harfbuzz' 'hidapi' 'libcap' 'libcloudproviders' 'libdatrie' 'libepoxy' 'libffi' 'libgcrypt' 'libgpg-error' 'libjpeg-turbo' 'libpng' 'libxrender' 'libthai' 'libtiff' 'libx11' 'libxau' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxrandr' 'lz4' 'pango' 'pcre' 'pixman' 'rust' 'systemd-libs' 'util-linux-libs' 'wayland' 'xz' 'zlib' 'zstd')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-beta.tar.gz")
sha256sums=('148849adb2e780964ca3506e5457b36eec17655e683f7132a1e4b7670ab58e13')
#noextract=('keyboard-configurator-0.2.7-beta.tar.gz')

build() {
	cd "$pkgbase-$pkgver-beta"
	make prefix=/usr
}

package_keyboard-configurator() {
	pkgdesc="System76 GUI for managing keyboards"
	depends=('xz' 'hidapi')

	cd "$pkgbase-$pkgver-beta"
	#make prefix="$pkgdir/usr/bin/" install
	install -Dm755 target/release/system76-keyboard-configurator "$pkgdir"/usr/bin/system76-keyboard-configurator
	install -Dm644 linux/com.system76.keyboardconfigurator.desktop "$pkgdir"/usr/share/applications/com.system76.keyboardconfigurator.desktop
	install -Dm644 data/icons/scalable/apps/com.system76.keyboardconfigurator.svg "$pkgdir"/usr/share/icons/com.system76.keyboardconfigurator.svg
}

