# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=ayuz
pkgname="$_pkgbase-bin"
pkgver=1.1.9
pkgrel=1
pkgdesc='The unofficial MyAsus alternative for Linux'
arch=('x86_64')
url='https://github.com/Traciges/Ayuz'
license=('GPL-3.0-or-later')
depends=('gtk4' 'gtk4-layer-shell' 'libadwaita')
optdepends=('libkscreen: OLED flicker-free dimming'
						'qt6-tools: KWin and KDE integration'
						'kconfig: OLED Pixel Refresh in KDE'
						'iio-sensor-proxy: Ambient light sensor for auto backlight'
						'swayidle: Keyboard backlight idle timer'
						'asusctl: Battery care, fan profiles, FN key mod'
						'supergfxctl: GPU mode switching'
						'wireplumber: Volume control & boost'
						'easyeffects: Audio sound profiles'
						'brightnessctl: Smart Gestures'
						'playerctl: Media playback control'
						'glib2: Touchpad toggle on GNOME')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
replaces=('asus-hub-bin')
source_x86_64=("$_pkgbase-$pkgver.deb::https://github.com/Traciges/Ayuz/releases/download/v$pkgver/ayuz_$pkgver-1_amd64.deb")
sha256sums_x86_64=('eb177e824c24c2341604c505f96e0f690727a68b3c0dbdb0f0f1cc9bc6efb3ef')

prepare() {
	bsdtar -xf "$_pkgbase-$pkgver.deb"
}

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"
	install -Dm0644 "$pkgdir/usr/share/doc/$_pkgbase/copyright" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
	rm -rf "$pkgdir/usr/share/doc"
}
