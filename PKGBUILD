# Maintainer: Joerg Weislogel <mutoroglin [at] posteo [dot] de>

pkgname=thunderbird-extension-localfolders
pkgver=4.2.2
pkgrel=1
pkgdesc='Thunderbird extension that adds as many local folders as you want to, even on mapped or network locations'
arch=('any')
url='https://github.com/cleidigh/Localfolder-TB'
license=('MPL-2.0')
depends=('thunderbird')
groups=('thunderbird-addons')
makedepends=('unzip' 'jq')
source=("license_MPL-2.0.html::http://www.mozilla.org/MPL/2.0/"
        "${pkgname}_${pkgver}-${pkgrel}.xpi::https://addons.thunderbird.net/thunderbird/downloads/file/1041261/localfolders-4.2.1-tb.xpi")
sha256sums=(SKIP
            '71d499b55b360769447e9f08536ee557b0419e84d5914e79c18558d86a21fbd9')
package() {
  depends=('thunderbird>=140')

  _extensionid=$(unzip -p ${pkgname}_${pkgver}-${pkgrel}.xpi manifest.json | jq -r ".applications.gecko.id")
  if [[ -z ${_extensionid} ]]; then
    printf "\033[31;1m==> ERROR: \033[37;1mthunderbird extension 'application id' not found!\033[0m\n"
    exit 1
  fi

  install -D -m644 ${pkgname}_${pkgver}-${pkgrel}.xpi "${pkgdir}/usr/lib/thunderbird/extensions/${_extensionid}.xpi"
  install -D -m644 license_MPL-2.0.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_MPL-2.0.html"
}
