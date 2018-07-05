# Maintainer: aimileus <me at aimileus dot nl>
# Maintainer: Gui||aume <michaudg@gmail.com>

pkgname=firefox-ubuntu-bin
_pkgname=firefox
pkgver=61.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with Ubuntu patches (binary)"
arch=("x86_64")
url="https://www.mozilla.org/firefox/"
license=('GPL' 'LGPL' 'MPL')
depends=(
  'dbus-glib'
  'ffmpeg'
  'gtk3'
  'hunspell'
  'icu'
  'libpulse'
  'libvpx'
  'libxt'
  'mime-types'
  'mozilla-common'
  'nss'
  'sqlite'
  'startup-notification'
  'ttf-font'
)
optdepends=(
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio:  Audio support'
  'speech-dispatcher: Text-to-Speech'
)
provides=('firefox' 'firefox-ubuntu')
conflicts=('firefox' 'firefox-ubuntu')

source=("https://launchpad.net/~ubuntu-mozilla-security/+archive/ubuntu/ppa/+build/15079094/+files/firefox_61.0+build3-0ubuntu0.18.04.1_amd64.deb")
sha256sums=('973217e836386df59f4ec7ee518e8f4919fff61495917a52eb495e7c516fc610')

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
