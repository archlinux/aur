# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# Use cndrvcups-lb UFR II if you don't have the PCL/PXL or PS license

# https://www.experts-exchange.com/questions/22609218/Canon-ImageRUNNER-3570-not-printing.html
# http://www.copytechnet.com/forums/canon/82370-canon-ir-2530-driver-problem.html

set -u
pkgname='canon-cque'
#_cnver='3.0-5'; _dl='45523'
#_cnver='4.0-0'; _dl64='48570'; _dl32=$((_dl64-1))
_cnver='4.0-1'; _dl64='48570'; _dl32=$((_dl64-1))

pkgver="${_cnver//-/.}"
pkgrel='1'
pkgdesc='CUPS printer driver for Canon imagePRESS imageRUNNER ADVANCE PRO C iR i-SENSYS FAX LBP MF Laser Shot PC-D copier printers, may require PCL/PXL or PS dealer LMS license'
arch=('i686' 'x86_64')
url='https://www.canon-europe.com/support/products/imagerunner/imagerunner-1730i.aspx'
license=('custom' 'GPL')
depends=('cups' 'cups-filters')
options=('!strip')
source=('LICENSE')
_fl="CQue_v${pkgver}_Linux_64_EN.tar"
source_x86_64=("${_fl//.tar/.tgz}::http://files.canon-europe.com/files/soft01-${_dl64}/Driver/${_fl}")
_fl="CQue_v${pkgver}_Linux_32_EN.tar"
source_i686=("${_fl//.tar/.tgz}::http://files.canon-europe.com/files/soft01-${_dl32}/Driver/${_fl}")
unset _fl
md5sums=('4df9593c184cd39bb9d9df6195c4d390')
md5sums_i686=('cfe9fbc36a79af0c09955b7c58271c95')
md5sums_x86_64=('aaab21e180cfd3891bc6dfc22330930d')
sha256sums=('343a624f559718d085b01605572fdf1cf33201931f06ef37567bbd497a29d333')
sha256sums_i686=('cf829d45509e4f1686187bbb04e471dacfe982f44bbdc1c76e9c8df3db0bbfbf')
sha256sums_x86_64=('0a793dd059445294d0428e1903e32b58e1913bb187053211cad5df93043caf46')

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
