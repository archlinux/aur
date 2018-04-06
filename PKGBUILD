# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: cdfk <cdfk1981-at-gmail.com>

set -u
pkgname='brother-cups-wrapper-laser'
pkgver='2.0.1_2_0ubuntu7'
pkgrel='1'
pkgdesc='cups wrapper drivers for DCP-7010 DCP-7020 DCP-7025 DCP-8060 DCP-8065DN FAX-2820 FAX-2920 HL-2030 HL-2040 HL-2070N HL-5240 HL-5250DN HL-5270DN HL-5280DW MFC-7220 MFC-7225N MFC-7420 MFC-7820N MFC-8460N MFC-8660DN MFC-8860DN MFC-8870DW'
arch=('i686' 'x86_64')
url='http://solutions.brother.com/linux/en_us/index.html'
license=('GPL' 'custom:brother commercial license')
depends=('brother-lpr-drivers-laser' 'brother-cups-wrapper-common')
makedepends=('gzip')
options=('!strip')
_verwatch=('http://mirrors.kernel.org/ubuntu/pool/multiverse/b/brother-cups-wrapper-laser/' '<a href="brother-cups-wrapper-laser_\(.\+\)_amd64.deb.*' 'f'); _getlinks() { sed -e 's:-\([0-9]\):_\1:g'; }
source_i686=("http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver//_/-}_i386.deb")
source_x86_64=("http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver//_/-}_amd64.deb")
md5sums_i686=('d7695f2d6747363f5870a8807945d178')
md5sums_x86_64=('d5d869b2c40c397e3706caffe2d48388')
sha256sums_i686=('d638c4679fe5045725646824088187366fa50b5574bb51a83efc18d082b20f72')
sha256sums_x86_64=('a22a6048607784ac9a48248008009a38807a09e00d2c6b8ea1ace05ee9f5f6af')

package() {
  set -u
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/data.tar".?z
  # This gets them to sort correctly but does not make automatic matching work.
  sed -Ee '/^\*(NickName|ShortNickName):/ s:(DCP|FAX|HL|MFC)([0-9]):\1-\2:g' -i 'usr/share/ppd/Brother'/*.ppd
  gzip 'usr/share/ppd/Brother'/*.ppd
  set +u
}
set +u
