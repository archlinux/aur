# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=intel-xdk
pkgver=2248
pkgrel=1
_rpmver=2.0-0
pkgdesc='Comprehensive, cross-platform HTML5 development environment'
arch=('i686' 'x86_64')
url='http://xdk.intel.com'
license=('custom')
depends=('libudev0')
makedepends=('rpmextract')

source=('intel-xdk')
md5sums=('f7438a93f7691901ac17ea39b3fbb6a8')

if [ "${CARCH}" == 'i686' ]; then
  _arch='32'
  _carch='i486'
  md5sums+=('44317be7d86cc31d60ff158b9b978c39')
elif [ "${CARCH}" == 'x86_64' ]; then
  _arch='64'
  _carch='x86_64'
  md5sums+=('d7a4f46571a2022038392f5ea13fbd82')
fi

_base="xdk_web_linux${_arch}"
source+=("https://download.xdk.intel.com/${_base}_master_${pkgver}.tgz")

package() {
  cd "${srcdir}/${_base}/rpm"
  rpmextract.sh "${pkgname}-${pkgver}-${_rpmver}.${_carch}.rpm"

  mkdir -p "${pkgdir}/opt/intel" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/${pkgname}"

  cp -r opt/intel/XDK "${pkgdir}/opt/intel/"
  rm -f "${pkgdir}/opt/intel/XDK/libudev.so.0"
  install -m755 "${srcdir}/intel-xdk" "${pkgdir}/usr/bin/"
  install -m644 "${pkgdir}/opt/intel/XDK/xdk/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
