# Maintainer: Cedric MATHIEU <me.xenom @ gmail.com>
# Contributor: Det <nimetonmaili @ gmail.com>
# Contributor: coderoar <coderoar @ gmail.com>
# Contributor: mephistopheles <mephisto.pheles.nyan @ gmail.com>
# Contributor: vitamin1980 <vitamin.novgorod @ yandex.ru>

pkgname=firefox-nightly-ru
pkgdesc='Web browser from mozilla.org, nightly build, russian version'
url='http://nightly.mozilla.org/'
pkgver=42.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_filename="firefox-${pkgver}.ru.linux-${CARCH}"
_baseurl="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n"
_md5sum="$(curl -vs "${_baseurl}/${_filename}.checksums" 2>&1 | grep bz | grep md5 | cut -d " " -f1)"
source=('firefox-nightly.desktop' 
        'firefox-nightly-safe.desktop' 
        'firefox-nightly-ru.install' 
        "${_baseurl}/${_filename}.tar.bz2")
md5sums=('aa4eb1b1b9dc42c610847b384ac968d7' 
         '92de362052d776a06ef4e53e9e0a3ddc' 
         '04793335a2ba7d17d1bd92085461e77e' 
         "${_md5sum}")
install=${pkgname}.install
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 
'sqlite' 'dbus-glib' 'desktop-file-utils')
conflicts=('firefox-nightly' 'firefox-nightly-russian')

package() {
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-nightly-ru"
  ln -s /opt/firefox-nightly-ru/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly-icon.png"
}