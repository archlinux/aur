# Maintainer: vitamin1980 <vitamin.novgorod @ yandex.ru>

pkgname=firefox-nightly-ru
pkgdesc='Web browser from mozilla.org, nightly build, russian version'
url='http://nightly.mozilla.org/'
pkgver=49.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_filename="firefox-${pkgver}.ru.linux-${CARCH}"
_baseurl="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n"
_md5sum="$(curl -vs "${_baseurl}/${_filename}.checksums" 2>&1 | grep bz | grep md5 | cut -d " " -f1)"
source=('firefox-nightly.desktop'
        'firefox-nightly-ru.install'
        'vendor.js'
        "${_baseurl}/${_filename}.tar.bz2")
md5sums=('fb1cd230fed616b263b46f49c3c17f0c'
         '04793335a2ba7d17d1bd92085461e77e'
         '32618013911bf84445afce815e3875b1'
         "${_md5sum}")
install=${pkgname}.install
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 
'sqlite' 'dbus-glib' 'desktop-file-utils')
conflicts=('firefox-nightly')

package() {
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-nightly-ru"
  ln -s /opt/firefox-nightly-ru/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}/firefox-nightly.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly-icon.png"
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/opt/firefox-nightly-ru/browser/defaults/preferences/vendor.js"
}
