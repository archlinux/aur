# Maintainer: Earendil <earendil AT veryfast DOT biz>
# Contributor: Corelli <corelli AT sent DOT com>
# Contributor: danyf90 <daniele.formichelli AT gmail DOT com>
# Contributor: Papajoker <papajoke [at] archlinux [dot] info>

_name=firefox
_channel=developer
pkgname="${_name}-${_channel}-fr"
pkgver=54.0a2
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, developer build - French"
url="http://www.mozilla.org/firefox/developer"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${pkgver}.fr.linux-${CARCH}"
_srcurl="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-aurora-l10n"
source=("${_srcurl}/${_file}.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
sha512sums=('SKIP'
            '46d1965a486bec2a533b4642c5190245abf1d58649aba246917ef68abe76b3b789c5aec8df77687dc2bfdaeb146b2ae81d42bfd0b4dacf3b5d6912e92a5948e4'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
depends=('gtk3' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib'
	 'alsa-lib' 'dbus-glib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme'
	 'libvpx' 'libevent' 'nss>=3.14.1' 'hunspell')
provides=(firefox-developer)
conflicts=(firefox-developer)

package() {
  install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox $pkgdir/opt/firefox-$_channel

  ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
  install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/${_name}-${_channel}-icon.png
  install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}
