# Maintainer: Gu1ll0me <michaudg@gmail.com>
# Contributor: aimileus <me at aimileus dot nl>

pkgname=firefox-ubuntu-bin
pkgver=84.0
pkgrel=1
_ubuntuver="$pkgver+build3-0ubuntu0.18.04.1_amd64"
pkgdesc="Standalone web browser from mozilla.org with Ubuntu patches (binary)"
arch=("x86_64")
url="https://www.mozilla.org/firefox/"
license=(MPL GPL LGPL)
depends=(gtk3 libxt startup-notification mime-types dbus-glib ffmpeg nss
         ttf-font libpulse)
optdepends=('appmenu-gtk-module: for KDE global menu'
            'libdbusmenu-gtk3: for KDE global menu'
            'networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=('firefox')
conflicts=('firefox' 'firefox-ubuntu')

source=("http://security.ubuntu.com/ubuntu/pool/main/f/firefox/firefox_$_ubuntuver.deb")
md5sums=('47efa9618133f0d4c0a1fb4106a4220d')

prepare() {
	# Don't extract copyright files, which are included in the licenses package
	tar -xvf data.tar.xz --exclude=usr/share/doc
}

package() {
	cp -r etc "$pkgdir/"
	cp -r usr "$pkgdir/"
}
