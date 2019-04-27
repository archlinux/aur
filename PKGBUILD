# Maintainer: Tassos Natsakis <7712382@eipieq.com>

pkgname="astra-sdk"
pkgver="2.0.15"
pkgrel=1
pkgdesc='SDK for the Astra Camera from Orbbec'
url="https://orbbec3d.com/develop/"
arch=('x86_64') 
license=("Apache")
depends=('sfml>=2.3' 'sfml<2.4')
makedepends=('gcc>=4.9', 'clang>=3.5')
options=('!strip') # Avoid time consuming operations.
PKGEXT='.pkg.gz.tar' 
_dir="AstraSDK-v${pkgver}-232757cc1d-20190327T080423Z-Linux"
source=("http://dl.orbbec3d.com/dist/astra/v${pkgver}/AstraSDK-v${pkgver}-232757cc1d-20190327T080423Z-Ubuntu16.04.tar.gz")
sha256sums=('63d35b1e4375ced587b547869545a060d2fc4f9f3d398ea8336d397bd655b7d3')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/include/${pkgname}"
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  mkdir -p "${pkgdir}/etc/udev/rules.d"
  mkdir -p "${pkgdir}/etc/ld.so.conf.d"

  cp "${srcdir}/${_dir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  cp -r "${srcdir}/${_dir}/docs" "${pkgdir}/usr/share/${pkgname}/"
  cp -r "${srcdir}/${_dir}/samples" "${pkgdir}/usr/share/${pkgname}/"
  cp -a "${srcdir}/${_dir}/bin/." "${pkgdir}/usr/bin/"
  cp -a "${srcdir}/${_dir}/include/." "${pkgdir}/usr/include/${pkgname}/"
  cp -a "${srcdir}/${_dir}/lib/." "${pkgdir}/usr/lib/${pkgname}/"
  cp -a "${srcdir}/${_dir}/java/." "${pkgdir}/usr/lib/${pkgname}/"

  cp "${srcdir}/${_dir}/install/orbbec-usb.rules" "${pkgdir}/etc/udev/rules.d/558-orbbec-usb.rules"
  echo "/usr/lib/astra-sdk" > "${pkgdir}/etc/ld.so.conf.d/astra-sdk.conf"
}

# vim:set et sw=2 sts=2:
