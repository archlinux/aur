# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# Use cndrvcups-lb UFR II if you don't have the PCL/PXL or PS license

# https://www.experts-exchange.com/questions/22609218/Canon-ImageRUNNER-3570-not-printing.html
# http://www.copytechnet.com/forums/canon/82370-canon-ir-2530-driver-problem.html

set -u
pkgname='canon-cque'
#_cnver='3.0-5'; _dl='45523'
_cnver='4.0-0'; _dl64='48570'; _dl32=$((_dl64-1))
pkgver="${_cnver//-/.}"
pkgrel='1'
pkgdesc='CUPS printer driver for Canon imagePRESS imageRUNNER ADVANCE PRO C iR i-SENSYS FAX LBP MF Laser Shot PC-D copier printers, requires PCL/PXL or PS dealer LMS license'
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
md5sums_i686=('fac0592e2cea0c5558c0d9590e830a31')
md5sums_x86_64=('2d33949d9b4d469057f4073f6f0a4ec7')
sha256sums=('343a624f559718d085b01605572fdf1cf33201931f06ef37567bbd497a29d333')
sha256sums_i686=('1b6d2eacd228ee21c74710958b17ff050c36052424ade8ea959ebaee4c626c85')
sha256sums_x86_64=('a72ad6ef7861410d123389c88346f492430a99dbdb1b6e56fdd58d7b4abf7725')

package() {
  set -u
  install -Dpm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "cque-en-${_cnver}"
  install -Dpm644 ppd/*.ppd* -t "${pkgdir}/usr/share/cups/model/Canon"
  install -Dpm644 doc/* -t "${pkgdir}//usr/share/doc/CQue${_cnver%-*}"
  install -Dpm755 'sicgsfilter' -t "${pkgdir}/usr/lib/cups/filter" # /usr/bin works too

  # zgrep -h -e '^\*ModelName:' ppd/* > "${startdir}/models.${pkgver}.txt"
  set +u
}
set +u
