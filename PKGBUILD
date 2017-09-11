# Maintainer: vitamin1980 <vitamin.novgorod @ yandex.ru>
# Contributor: McModder <mcmodder @ mcmodder.ru>

pkgname=firefox-nightly-ru
pkgdesc='Web browser from mozilla.org, nightly build, russian version'
url='http://nightly.mozilla.org/'
pkgver=57.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_filename="firefox-${pkgver}.ru.linux-${CARCH}"
_baseurl="https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n"
_sha512sum="$(curl -vs "${_baseurl}/${_filename}.checksums" 2>&1 | grep bz | grep sha512 | cut -d " " -f1 | head -n 1)"
source=('firefox-nightly.desktop'
        'firefox-nightly-ru.install'
        'vendor.js'
        "${_baseurl}/${_filename}.tar.bz2")
sha512sums=('5c825fab6b7bd279d372cfb5dad35293d212c89b73dcfb9b0e83f166159567d8ba3fc642b35fda57b20a0f2e8cc346b83ee1d469920d973096257d718ec3beb7'
         'bc940986f5acb02706714d5dcbc32e17b167190dc9a30c7d63bf5317a45a1a0ff9da5ea302b9c8efc32acf7b75d2dec1420f542cb0ba08c3e3d59273d18baa96'
         'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010'
         "${_sha512sum}")
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
