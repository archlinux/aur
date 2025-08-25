# Maintainer: Joerg Weislogel <mutoroglin [at] posteo [dot] de>

pkgname=thunderbird-extension-localfolders
pkgver=4.2.1
pkgrel=2
pkgdesc='Thunderbird extension that adds as many local folders as you want to, even on mapped or network locations'
arch=('any')
url='https://github.com/cleidigh/Localfolder-TB'
license=('MPL-2.0')
depends=('thunderbird')
groups=('thunderbird-addons')
makedepends=('unzip' 'jq')
source=("license_MPL-2.0.html::http://www.mozilla.org/MPL/2.0/"
        "${pkgname}_${pkgver}-${pkgrel}.xpi::https://addons.thunderbird.net/thunderbird/downloads/file/1040738/localfolders-4.2.1-tb.xpi")
sha256sums=(SKIP
            'b8e2b7e5b3636051dc87c2bf3480669a374763527cca1972567fc8bf9d2eaee0')
package() {
  depends=('thunderbird>=140')

  _extensionid=$(unzip -p ${pkgname}_${pkgver}-${pkgrel}.xpi manifest.json | jq -r ".applications.gecko.id")
  if [[ -z ${_extensionid} ]]; then
    printf "\033[31;1m==> ERROR: \033[37;1mthunderbird extensio 'application id' not found!\033[0m\n"
    exit 1
  fi

  install -D -m644 ${pkgname}_${pkgver}-${pkgrel}.xpi "${pkgdir}/usr/lib/thunderbird/extensions/${_extensionid}.xpi"
  install -D -m644 license_MPL-2.0.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_MPL-2.0.html"
}
