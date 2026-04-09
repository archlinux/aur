# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=asus-hub
pkgname="$_pkgbase-bin"
pkgver=1.0.2
pkgrel=1
pkgdesc='The unofficial MyAsus alternative for Linux'
arch=('x86_64')
url='https://github.com/Traciges/Asus-Hub'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita')
optdepends=('libkscreen: OLED flicker-free dimming'
						'qt6-tools: KWin and KDE integration'
						'kconfig: OLED Pixel Refresh in KDE'
						'iio-sensor-proxy: Ambient light sensor for auto backlight'
						'swayidle: Keyboard backlight idle timer'
						'asusctl: Battery care, fan profiles, FN key mod'
						'wireplumber: Volume control & boost'
						'easyeffects: Audio sound profiles'
						'glib2: Touchpad toggle on GNOME')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source_x86_64=("$_pkgbase.deb::https://github.com/Traciges/Asus-Hub/releases/download/v$pkgver/asus-hub_$pkgver-1_amd64.deb")
sha256sums_x86_64=('9b5266463cd6b9e3a8596a5c3ba3d5d5e91806f06826f98499152d98a6b83060')

prepare() {
	bsdtar -xf "$_pkgbase.deb"
}

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"
	install -Dm0644 "$pkgdir/usr/share/doc/$_pkgbase/copyright" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
	rm -rf "$pkgdir/usr/share/doc"
}
