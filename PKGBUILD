# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=asus-hub
pkgname="$_pkgbase-bin"
pkgver=1.0.2
pkgrel=2
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
source_x86_64=("$_pkgbase-$pkgver.deb::https://github.com/Traciges/Asus-Hub/releases/download/v$pkgver/asus-hub_$pkgver-1_amd64.deb")
sha256sums_x86_64=('f87e44f3fe02a0f62740765e1783d7fb1632576fc3f4377258e79473234e90df')

prepare() {
	bsdtar -xf "$_pkgbase-$pkgver.deb"
}

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir"
	install -Dm0644 "$pkgdir/usr/share/doc/$_pkgbase/copyright" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
	rm -rf "$pkgdir/usr/share/doc"
}
