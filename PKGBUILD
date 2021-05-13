# Maintainer: Aaron Honeycutt <aaron at system76 dot com>
pkgname=('keyboard-configurator')
pkgbase=keyboard-configurator
pkgver=0.2.4
pkgrel=2
pkgdesc="Configures keymap and backlight of System76 keyboards."
arch=('x86_64')
url="https://github.com/pop-os/keyboard-configurator"
license=('GPL3')
makedepends=('atk' 'at-spi2-atk' 'at-spi2-core' 'bzip2' 'cairo' 'dbus' 'expat' 'fontconfig' 'freetype2' 'fribidi' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'graphite' 'gtk3' 'harfbuzz' 'hidapi' 'libcap' 'libcloudproviders' 'libdatrie' 'libepoxy' 'libffi' 'libgcrypt' 'libgpg-error' 'libjpeg-turbo' 'libpng' 'libxrender' 'libthai' 'libtiff' 'libx11' 'libxau' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 'libxi' 'libxinerama' 'libxkbcommon' 'libxrandr' 'lz4' 'pango' 'pcre' 'pixman' 'rust' 'systemd-libs' 'util-linux-libs' 'wayland' 'xz' 'zlib' 'zstd')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-beta.tar.gz")
sha256sums=('e50311da2da5d59f2ebf1f30c6067f8ffae5535cf0da3ad28cfcbb77a355cc70')
#noextract=('keyboard-configurator-0.2.4.tar.gz')

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

