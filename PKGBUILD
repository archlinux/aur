# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=intel-xdk
pkgver=3759
pkgrel=2
pkgdesc='Cross-platform mobile and IoT development environment'
arch=('i686' 'x86_64')
url='https://software.intel.com/en-us/intel-xdk'
license=('custom')
depends=('libudev0' 'libnotify' 'gconf')

source=('intel-xdk'
        'intel-xdk.desktop')
sha256sums=('f091a3a84380b9bcd2d5daf402e3f73cc071b0f01205e773a32af6651bdce4d3'
            '8e6551d803e6c604e823d2589987c7a85973de69f59ce72660b107d82474dd9b')

if [ "${CARCH}" == 'i686' ]; then
  _arch='32'
  sha256sums+=('d23e188526b328227da2361e3fd30ff4cf1de27195014c65efb0f9cb10932b9b')
elif [ "${CARCH}" == 'x86_64' ]; then
  _arch='64'
  sha256sums+=('86d0493714b0c66f109f20fb1d6ddf1e4596411003426962642746e5c5065050')
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
