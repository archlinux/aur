# Maintainer: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Aaron Ogle <aaron@geekgonecrazy.com>

pkgname=openwmail-bin
pkgver=1.0.0
_pkgverdash=1-0-0
pkgrel=1
pkgdesc="Desktop client for Gmail and Google Inbox, community run Fork of wmail"
arch=('x86_64')
license=('MPL')
depends=('libnotify'
         'gconf'
         'alsa-lib'
         'libxss'
         'libxtst'
         'nss'
         'gtk2')
provides=('openwmail')
conflicts=('openwmail')
url="https://github.com/openwmail/openwmail"
source=("https://github.com/openWMail/openWMail/releases/download/v${pkgver}/openWMail_${_pkgverdash}_Linux_x86_64.deb")
md5sums=('d84ceea682905b58531c43f5962317fb')
PKGEXT='.pkg.tar'

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  chmod +x ${pkgdir}/opt/openwmail/openWMail
  ln -s /opt/openwmail/openWMail ${pkgdir}/usr/bin

  install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  mv ${pkgdir}/opt/openwmail/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
  mv ${pkgdir}/opt/openwmail/vendor-licenses/LICENSES{.chromium.html,.vendor} ${pkgdir}/usr/share/licenses/${pkgname}/

  rm -r ${pkgdir}/opt/openwmail/vendor-licenses/
  rm ${pkgdir}/opt/openwmail/openwmail.desktop
}

