# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=razorsql
pkgver=9.2.4
_pkgver=9_2_4
pkgrel=1
pkgdesc="An SQL query tool, database browser, SQL editor, and database administration tool (Trial)"
arch=('x86_64')
url='https://razorsql.com'
license=("custom:${pkgname}")
depends=('java-runtime>=8'
         'libxrender'
         'alsa-lib'
         'freetype2'
         'libxtst'
         'libnet'
         'sqlite'
         'python'
         'lib32-glibc')
makedepends=('unzip' 'gendesk')
noextract=("${pkgname}-${pkgver}.zip")
source=("${pkgname}-${pkgver}.zip::https://s3.dualstack.us-east-1.amazonaws.com/downloads.razorsql.com/downloads/${_pkgver}/razorsql${_pkgver}_linux_x64.zip")
sha256sums=('46ce85666bf1f25938a653deb0a3af3afdb07720ffba7e04f2861f9f8e0872b8')

package() {
  install -d "${pkgdir}/opt"
  unzip ${pkgname}-${pkgver}.zip -d "${pkgdir}/opt"
  echo "#!/usr/bin/env bash
  cd /opt/razorsql/
  ./RazorSQL "\$\@"" > razorsql.sh
  install -Dm755 razorsql.sh "${pkgdir}/usr/bin/razorsql"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "RazorSQL" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Development;Utility' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/opt/razorsql/icons/razorsql256.png" "${pkgdir}/usr/share/pixmaps/razorsql.png"
  install -Dm644 "${pkgdir}/opt/razorsql/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
