# Maintainer: Simon Brulhart <simon@brulhart.me>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=firefox-beta-bin-all-localizations
_mypkgn=firefox-beta
pkgdesc='Perl script for installing latest FF beta in the language of your choice'
url='http://www.mozilla.com/firefox/channel/'
pkgver=40.0b4
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL' 'GPL3')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'gstreamer0.10-base-plugins: vorbis decoding, ogg demuxing'
	    'gstreamer0.10-good-plugins: webm and mp4 demuxing'
	    'gstreamer0.10-bad-plugins: aac, vp8 and opus decoding'
	    'gstreamer0.10-ugly-plugins: h.264 and mp3 decoding'
	    'gstreamer0.10-ffmpeg: more decoders'
            'libpulse: PulseAudio audio driver')
makedepends=('perl-file-slurp' 'perl-lwp-protocol-https' 'perl-switch')
install=firefox.install
source=('firefox-beta-bin.desktop' 'firefox-beta-bin-safe.desktop' 'ff-downloader.pl')
build() {
  perl ff-downloader.pl -v $pkgver
}

package() {
  bsdtar -jxf firefox-${pkgver//rc*/}.tar.bz2
  mkdir -p $pkgdir/usr/{lib,bin,share/{applications,pixmaps}}

  cp -r firefox "${pkgdir}/usr/lib/${_mypkgn}"
  ln -s /usr/lib/${_mypkgn}/firefox ${pkgdir}/usr/bin/firefox-beta

  install -m644 {firefox-beta-bin.desktop,firefox-beta-bin-safe.desktop} ${pkgdir}/usr/share/applications/
  install -m644 ${srcdir}/firefox/browser/icons/mozicon128.png ${pkgdir}/usr/share/pixmaps/${_mypkgn}-icon.png
}
md5sums=('09569434d20ceb6c7e6a267249f8ab48'
         '6fc7dee182dd7cca644c9d8a5861cf62'
         'd1c065767aba9677bea343afba248410')
