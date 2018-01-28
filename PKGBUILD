# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# Use cndrvcups-lb UFR II if you don't have the PCL/PXL or PS license

# https://www.experts-exchange.com/questions/22609218/Canon-ImageRUNNER-3570-not-printing.html
# http://www.copytechnet.com/forums/canon/82370-canon-ir-2530-driver-problem.html

set -u
pkgname='canon-cque'
_cnver='3.0-5'
pkgver="${_cnver//-/.}"; _dl='45523'
pkgrel='1'
pkgdesc='CUPS printer driver for Canon imagePRESS imageRUNNER ADVANCE PRO C iR i-SENSYS FAX LBP MF Laser Shot PC-D copier printers, requires PCL/PXL or PS dealer LMS license'
arch=('any')
url='https://www.canon-europe.com/support/products/imagerunner/imagerunner-1730i.aspx'
license=('custom' 'GPL')
depends=('cups' 'cups-filters')
options=('!strip')
source=("http://files.canon-europe.com/files/soft${_dl}/Software/CQue_v${pkgver}_Linux_32_64_EN.tar.zip")
sha256sums=('a23c4c53ec3c215f24937878fcc0780d7f3adfc7aac8c260506a42f31e6e416b')

_servicename="${pkgname}.service"

prepare() {
  set -u
  declare -A _archf=([i686]='i386' [x86_64]='x86_64')
  bsdtar -xf "cque-en-${_cnver}.${_archf[${CARCH}]}.tar.gz"
  set +u
}

package() {
  set -u
  install -Dpm644 "${srcdir}/cque-en-${_cnver}/ppd"/*.ppd* -t "${pkgdir}/usr/share/cups/model/Canon"
  install -Dpm755 "${srcdir}/cque-en-${_cnver}/sicgsfilter" -t "${pkgdir}/usr/lib/cups/filter" # /usr/bin works too
  set +u
}

set +u
