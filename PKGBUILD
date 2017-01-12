# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=intel-xdk
pkgver=3759
pkgrel=1
pkgdesc='Cross-platform mobile and IoT development environment'
arch=('i686' 'x86_64')
url='https://software.intel.com/en-us/intel-xdk'
license=('custom')
depends=('libudev0' 'libnotify' 'gconf')

source=('intel-xdk' 'intel-xdk.desktop')
md5sums=('f7438a93f7691901ac17ea39b3fbb6a8' '34d9c2b87221acf10812ab1150357dc9')

if [ "${CARCH}" == 'i686' ]; then
  _arch='32'
  md5sums+=('612b3a7ef3a9d40c214e7b17f60f14fd')
elif [ "${CARCH}" == 'x86_64' ]; then
  _arch='64'
  md5sums+=('fba36f9c2171078dfa2c495f066073b6')
fi

_base="xdk_web_linux${_arch:-64}"
source+=("https://appcenter.html5tools-software.intel.com/api/v3.0/redirect/updates/xdk/${_base}_master_${pkgver}.tgz")

package() {
  mkdir -p "${pkgdir}/opt/intel/XDK" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}/${_base}_${pkgver}/rpm"
  tar xf "${pkgname}-${pkgver}.0.0.tgz" -C "${pkgdir}/opt/intel/XDK"

  rm -f "${pkgdir}/opt/intel/XDK/libudev.so.0"
  install -m755 "${srcdir}/intel-xdk" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/intel-xdk.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${pkgdir}/opt/intel/XDK/xdk/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
