# Maintainer: Simon Brulhart <simon@brulhart.me>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=firefox-beta-bin-all-localizations
_mypkgn=firefox-beta
pkgdesc='Perl script for installing latest FF beta in the language of your choice'
url='http://www.mozilla.com/firefox/channel/'
pkgver=46.0b10
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL' 'GPL3')
depends=('gtk2' 'gtk3' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'ffmpeg: additional video and audio decoders'
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
         '76931e404fcd020672b19666329143ee')
