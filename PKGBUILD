# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=intel-xdk
pkgver=3987
pkgrel=1
pkgdesc='Cross-platform mobile and IoT development environment'
arch=('i686' 'x86_64')
url='https://software.intel.com/en-us/intel-xdk'
license=('custom')
depends=('libudev0' 'libnotify' 'gconf')
source=('intel-xdk'
        'intel-xdk.desktop')
sha256sums=('713961147b32e05ee8f0e97a60920d2254c2c74053fe4bb73f55c69d74b17a37'
            '8e6551d803e6c604e823d2589987c7a85973de69f59ce72660b107d82474dd9b')
source_i686=("https://appcenter.html5tools-software.intel.com/api/v3.0/redirect/updates/xdk/xdk_web_linux32_master_${pkgver}.tgz")
sha256sums_i686=('a78cf1fbb7c445e5979ba3076214289bf1ef5417911c5ac6044b91c3f0e0dd7f')
source_x86_64=("https://appcenter.html5tools-software.intel.com/api/v3.0/redirect/updates/xdk/xdk_web_linux64_master_${pkgver}.tgz")
sha256sums_x86_64=('c049c5e7907f0e0a3d021ad85c941edd95132b7b3338cfca5ee74a9403b55ca2')

package() {
  local _CARCH_BITS=$([ "$CARCH" == i686 ] && echo '32' || echo '64')
  cd "${srcdir}/xdk_web_linux${_CARCH_BITS}_${pkgver}"/rpm

  install -dm755 "${pkgdir}"/opt/intel/XDK
  tar xf "${pkgname}-${pkgver}.0.0.tgz" -C "${pkgdir}"/opt/intel/XDK

  rm -f "${pkgdir}"/opt/intel/XDK/libudev.so.0
  install -Dm755 "${srcdir}"/intel-xdk "${pkgdir}"/usr/bin/intel-xdk
  install -Dm644 "${srcdir}"/intel-xdk.desktop "${pkgdir}"/usr/share/applications/intel-xdk.desktop
  install -Dm644 "${pkgdir}"/opt/intel/XDK/xdk/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
