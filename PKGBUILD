# Maintainer: Tassos Natsakis <7712382@eipieq.com>

release='beta3'
pkgname="astra-sdk"
pkgver="2.0.9"
pkgrel=1
pkgdesc='SDK for the Astra Camera from Orbbec'
url="https://orbbec3d.com/develop/"
arch=('x86_64') 
license=("Apache")
depends=()
makedepends=('gcc>=4.9', 'clang>=3.5')
options=('!strip') # Avoid time consuming operations.
PKGEXT='.pkg.gz.tar' 
_dir="AstraSDK-v${pkgver}-${release}-dc1f53e9c9-20180623T013908Z-Linux"
source=("http://dl.orbbec3d.com/dist/astra/v${pkgver}-${release}-d/AstraSDK-v${pkgver}-${release}d-dc1f53e9c9-20180623T013908Z-Ubuntu1604.tar.gz")
sha256sums=('c1c8879d1a49847871e6131460ebf71713f5ae0cdc8b075918e165ba358e4ed5')

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
