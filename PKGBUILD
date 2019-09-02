# Maintainer: Gu1ll0me <michaudg@gmail.com>
# Contributor: aimileus <me at aimileus dot nl>

pkgname=firefox-ubuntu-bin
_pkgname=firefox
pkgver=69.0
pkgrel=1
_ubuntuver="$pkgver+build2-0ubuntu0.19.04.1_amd64"
pkgdesc="Standalone web browser from mozilla.org with Ubuntu patches (binary)"
arch=("x86_64")
url="https://www.mozilla.org/firefox/"
license=('GPL' 'LGPL' 'MPL')
depends=('mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'hicolor-icon-theme'
	 'libvpx' 'icu'  'libevent' 'nss>=3.28.3' 'nspr>=4.10.6' 'hunspell'
	 'sqlite' 'libnotify' 'ffmpeg' 'gtk3'
         # system av1
         'dav1d' 'aom'
         # system harfbuzz
         'harfbuzz'
         # system graphite
         'graphite'
         # system webp
         'libwebp'
         # system libevent
         'libevent'
        )
optdepends=('networkmanager: Location detection via available WiFi networks'
            'speech-dispatcher: Text-to-Speech'
            'pulseaudio: Audio support')
provides=('firefox' 'firefox-ubuntu')
conflicts=('firefox' 'firefox-ubuntu')

source=("http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu/pool/main/f/firefox/firefox_$_ubuntuver.deb")
sha256sums=('9d01bfb376bb91eb2797d625326ba9306a4043bb4737c48e4d62184f53d0c62c')

prepare() {
	# Don't extract copyright files, which are included in the licenses package
	tar -xvf data.tar.xz --exclude=usr/share/doc
	# UBUNTU_MENUPROXY=0 is a requirement for global menus
	# https://github.com/rilian-la-te/vala-panel-appmenu/issues/125
	sed -i 's|Exec=firefox|Exec=env UBUNTU_MENUPROXY=0 firefox|' usr/share/applications/firefox.desktop
}

package() {
	cp -r etc "$pkgdir/"
	cp -r usr "$pkgdir/"
}
