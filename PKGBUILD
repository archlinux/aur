# Maintainer: Arif <>
# Contributors: Gui||aume <michaudg@gmail.com>


pkgname=firefox-ubuntu-bin
_pkgname=firefox
pkgver=64.0
pkgrel=1
_ubuntuver="$pkgver+build3-0ubuntu0.18.10.1_amd64"
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

source=("http://archive.ubuntu.com/ubuntu/pool/main/f/firefox/firefox_$_ubuntuver.deb")
sha256sums=('14755c8ec83ed6e76d9a40d707f0a60a99cb0730c0982472e71d0fe03a4c64d8')
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

