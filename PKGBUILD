# Maintainer: Simon Brulhart <simon@brulhart.me>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=firefox-beta-bin-all-localizations
_mypkgn=firefox-beta
pkgdesc='Perl script for installing latest FF beta in the language of your choice'
url='https://www.mozilla.com/firefox/channel/#beta'
pkgver=56.0b10
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
depends=('gtk3' 'libxt' 'dbus-glib' 'nss')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'ffmpeg: additional video and audio decoders'  # Not sure this is useful
            'libnotify: Notification integration'
            'pulseaudio: Audio support')
makedepends=('perl-file-slurp' 'perl-lwp-protocol-https' 'perl-switch')
provides=("firefox=$pkgver")
source=('firefox-beta-bin.desktop' 'ff-downloader.pl')

build() {
  perl ff-downloader.pl -v $pkgver
}

package() {
  bsdtar -jxf firefox-${pkgver}.tar.bz2
  mkdir -p $pkgdir/usr/{lib,bin,share/{applications,pixmaps}}

  cp -r firefox "${pkgdir}/usr/lib/${_mypkgn}"
  ln -s /usr/lib/${_mypkgn}/firefox ${pkgdir}/usr/bin/firefox-beta

  install -m644 firefox-beta-bin.desktop ${pkgdir}/usr/share/applications/
  install -m644 ${srcdir}/firefox/browser/icons/mozicon128.png ${pkgdir}/usr/share/pixmaps/${_mypkgn}-icon.png
}
md5sums=('09569434d20ceb6c7e6a267249f8ab48'
         'b4d5afd97c8ac229f6027d7853c73c0c')
