# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# Use cndrvcups-lb UFR II if you don't have the PCL/PXL or PS license

# https://www.experts-exchange.com/questions/22609218/Canon-ImageRUNNER-3570-not-printing.html
# http://www.copytechnet.com/forums/canon/82370-canon-ir-2530-driver-problem.html

set -u
pkgname='canon-cque'
#_cnver='3.0-5'; _dl='45523'
#_cnver='4.0-0'; _dl64='48570'; _dl32=$((_dl64-1))
_cnver='4.0-3'; _dl64='48570'; _dl32=$((_dl64-1))
#https://files.canon-europe.com/files/soft01-48570/Driver/CQue_v4.0.3_Linux_64_EN.tar.gz

pkgver="${_cnver//-/.}"
pkgrel='1'
pkgdesc='CUPS printer driver for Canon imagePRESS imageRUNNER ADVANCE PRO C iR i-SENSYS FAX LBP MF Laser Shot PC-D copier printers, may require PCL/PXL or PS dealer LMS license'
arch=('i686' 'x86_64')
url='https://www.canon-europe.com/support/products/imagerunner/imagerunner-1730i.aspx'
license=('custom' 'GPL')
depends=('cups' 'cups-filters')
options=('!strip')
source=('LICENSE')
_fl="CQue_v${pkgver}_Linux_64_EN.tar.gz"
source_x86_64=("https://files.canon-europe.com/files/soft01-${_dl64}/Driver/${_fl}")
_fl="${_fl//64/32}"
source_i686=("https://files.canon-europe.com/files/soft01-${_dl32}/Driver/${_fl}")
unset _fl
md5sums=('4df9593c184cd39bb9d9df6195c4d390')
md5sums_i686=('4ebc972c05dbb87b4fa11d1ab18d1dd7')
md5sums_x86_64=('0076333d89bf9bd262ac502016ebffe2')
sha256sums=('343a624f559718d085b01605572fdf1cf33201931f06ef37567bbd497a29d333')
sha256sums_i686=('ec9ed3f2fe9e28ba3c1d6591e5945710a1be59fc1629ed59c9461946659c2af8')
sha256sums_x86_64=('32e19bf28fd59cc0a7b95200f9dc96da53f579fd9ceedef53cac55c28994b401')

package() {
  set -u
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "cque-en-${_cnver}"
  install -Dpm644 ppd/*.ppd* -t "${pkgdir}/usr/share/cups/model/Canon"
  install -Dpm644 doc/* -t "${pkgdir}/usr/share/doc/CQue${_cnver%-*}"
  install -Dpm755 'sicgsfilter' -t "${pkgdir}/usr/lib/cups/filter" # /usr/bin works too

  # zgrep -h -e '^\*ModelName:' ppd/* > "${startdir}/models.${pkgver}.txt"
  set +u
}
set +u
