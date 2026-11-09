# SPDX-License-Identifier: 0BSD
# Maintainer: Fabio Di Giorgio <ravnos at duck dot com>

pkgname=artcraft-launcher-bin
_pkgname=${pkgname%-bin}
pkgver=0.17.0
pkgrel=1
pkgdesc='Install, update and launch the Craft App Suite (prebuilt binary)'
arch=(x86_64 aarch64)
url='https://github.com/storytold/craft-launcher'
license=('MIT OR Apache-2.0')
depends=(gcc-libs
         glibc
         hicolor-icon-theme
         libxkbcommon
         libxkbcommon-x11
         vulkan-icd-loader)
optdepends=('alsa-lib: sound support'
            'pipewire-alsa: audio playback and recording via PipeWire'
            'pulseaudio: audio playback and recording via PulseAudio'
            'wayland: native Wayland display support'
            'libx11: X11 and XWayland display support'
            'libxcursor: X11 cursor handling'
            'libxi: X11 input handling'
            'libxrandr: X11 display resolution handling'
            'libglvnd: GPU rendering through EGL'
            'mesa: GPU rendering through EGL'
            'vulkan-driver: GPU rendering through Vulkan'
            'xdg-desktop-portal: native desktop integration and file dialogs'
            'cups: printing support')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-appimage")
options=(!strip !debug)
_archive="$_pkgname-$pkgver-linux"
source_x86_64=("$url/releases/download/v$pkgver/$_archive-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_archive-aarch64.tar.gz")
sha256sums_x86_64=('bbf2b1b84f52bbae81f8723034cce2d5862f28664adb28787fb11e1d4b93b98a')
sha256sums_aarch64=('81a60694313a986accc5d61fe45c2cc57750485b776365a0c44406c52ee80192')

package() {
	cd "$_archive-$CARCH"
	install -Dm0755 -t "$pkgdir/usr/bin/" "bin/$_pkgname"
	cp -a --no-preserve=ownership share "$pkgdir/usr/"
	install -dm0755 "$pkgdir/usr/share/licenses/$pkgname"
	mv "$pkgdir/usr/share/doc/$_pkgname"/{LICENSE-APACHE,LICENSE-MIT,NOTICE} "$pkgdir/usr/share/licenses/$pkgname/"
}
