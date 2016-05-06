# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=intel-xdk-ea
pkgver=3172
pkgrel=2
_rpmver=2.0-0
pkgdesc='Comprehensive, cross-platform HTML5 development environment (pre-release version)'
arch=('i686' 'x86_64')
url='https://software.intel.com/en-us/intel-xdk-early-access'
license=('custom')
depends=('libudev0' 'libnotify')
makedepends=('rpmextract')

source=('intel-xdk-ea')
md5sums=('a8cd1ad751fddfe10a82331109967b11')

if [ "${CARCH}" == 'i686' ]; then
  _arch='32'
  _carch='i486'
  md5sums+=('3038b7916e87d20ac1c742d716c9fddb')
elif [ "${CARCH}" == 'x86_64' ]; then
  _arch='64'
  _carch='x86_64'
  md5sums+=('666433308ff73aad8901440e72c09add')
fi

_base="xdk-ea_web_linux${_arch}"
source+=("https://download.xdk.intel.com/xdk-ea/${_base}_master-ea_${pkgver}.tgz")

package() {
  cd "${srcdir}/${_base}/rpm"
  rpmextract.sh "${pkgname}-${pkgver}-${_rpmver}.${_carch}.rpm"

  mkdir -p "${pkgdir}/opt/intel" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -r opt/intel/XDK_Early_Access "${pkgdir}/opt/intel/"
  rm -f "${pkgdir}/opt/intel/XDK_Early_Access/libudev.so.0"
  install -m755 "${srcdir}/intel-xdk-ea" "${pkgdir}/usr/bin/"
  install -m644 "${pkgdir}/opt/intel/XDK_Early_Access/xdk/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
