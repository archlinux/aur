# Maintainer: Joerg Weislogel <mutoroglin [at] posteo [dot] de>

pkgname=thunderbird-extension-localfolders
pkgver=4.2.0
pkgrel=2
pkgdesc='Thunderbird extension that adds as many local folders as you want to, even on mapped or network locations'
arch=('any')
url='https://github.com/cleidigh/Localfolder-TB'
license=('MPL-2.0')
depends=('thunderbird')
groups=('thunderbird-addons')
makedepends=('unzip' 'jq')
source=("license_MPL-2.0.html::http://www.mozilla.org/MPL/2.0/"
        "${pkgname}_${pkgver}-${pkgrel}.xpi::https://addons.thunderbird.net/thunderbird/downloads/file/1040538/localfolders-4.2.0-tb.xpi")
sha256sums=(SKIP
            'f46a654e7a97fed79afd5c6dadd083e47d6dfea159c22329dfcfc3d4750e75cd')
package() {
  _extensionid=$(unzip -p ${pkgname}_${pkgver}-${pkgrel}.xpi manifest.json | jq -r ".applications.gecko.id")

  install -D -m644 ${pkgname}_${pkgver}-${pkgrel}.xpi "${pkgdir}/usr/lib/thunderbird/extensions/${_extensionid}.xpi"
  install -D -m644 license_MPL-2.0.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_MPL-2.0.html"
}
