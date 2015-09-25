# Maintainer: strg "kbks_a_o2.pl >
# Contributor: Luis von Bernus <PaterSiul@gmail.com>
# Contributors: L42y, aeosynth, Dan Serban, Kalipath, py_crash , ravicious

pkgname=firefox-aurora-pl
pkgver=43.0a2
pkgrel=1
pkgdesc="Firefox Aurora Developer Edition (Polish l10n)"
url=https://www.mozilla.org/en-US/firefox/developer/all/
arch=(i686 x86_64)
license=(MPL GPL LGPL)
depends=('gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 
	 'alsa-lib' 'dbus-glib' 'libnotify' 'desktop-file-utils' 'hicolor-icon-theme'
	 'libvpx' 'libevent' 'nss>=3.14.1' 'hunspell')
optdepends=()
makedepends=('wget')
provides=(firefox-aurora)
conflicts=(firefox-aurora)
install=$pkgname.install
_baseurl=http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-aurora-l10n/
_filename=firefox-${pkgver}.pl.linux-${CARCH}
source=(firefox-aurora-pl.desktop
	"${_baseurl}/${_filename}.tar.bz2")
_md5=$(wget -qO- ${_baseurl}/${_filename}.checksums | awk -F' ' '$2 == "md5" && $4 == "'"${_filename}.tar.bz2"'" { print $1 } ')
md5sums=('663176661ce817e40b4217c5e107df42'
         ${_md5})
package()
{
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  mv firefox firefox-aurora
  mv firefox-aurora "${pkgdir}"/opt/
  ln -s /opt/firefox-aurora/firefox "${pkgdir}"/usr/bin/firefox-aurora
  install -m644 "${startdir}"/firefox-aurora-pl.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${pkgdir}"/opt/firefox-aurora/browser/icons/mozicon128.png "${pkgdir}"/usr/share/pixmaps/firefox-aurora-icon.png
}


