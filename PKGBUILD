# Maintainer: Tassos Natsakis <7712382@eipieq.com>
# Packager: Tassos Natsakis <7712382@eipieq.com>

pkgname="astra-sdk"
pkgver="2.1.1"
_pkgcsum="24f74b8b15"
_pkgtstamp="20200426T014025Z"
pkgrel=1
pkgdesc='SDK for the Astra Camera from Orbbec'
url="https://orbbec3d.com/develop/"
arch=('x86_64') 
license=("Apache")
depends=('sfml2.3')
makedepends=('gcc>=4.9', 'clang>=3.5')
options=('!strip') # Avoid time consuming operations.
PKGEXT='.tar.gz' 
_dir="AstraSDK-v${pkgver}-${_pkgcsum}-${_pkgtstamp}-Ubuntu18.04-${arch}"
source=("http://dl.orbbec3d.com/dist/astra/v${pkgver}/AstraSDK-v${pkgver}-${_pkgcsum}-Ubuntu-x86_64.zip")
sha256sums=('14a6835156add7a4a1f21774cccc9a66cd6da6f0d99adb06b6431a97b14f81ee')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}/docs"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/usr/include/${pkgname}"
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  mkdir -p "${pkgdir}/etc/udev/rules.d"
  mkdir -p "${pkgdir}/etc/ld.so.conf.d"

  tar -xzvf "${srcdir}/AstraSDK-v${pkgver}-${_pkgcsum}-${_pkgtstamp}-Ubuntu18.04-${arch}.tar.gz"
  cp "${srcdir}/${_dir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  cp -r "${srcdir}/${_dir}/samples" "${pkgdir}/usr/share/${pkgname}/"
  cp -a "${srcdir}/${_dir}/bin/." "${pkgdir}/usr/bin/"
  cp -a "${srcdir}/${_dir}/include/." "${pkgdir}/usr/include/${pkgname}/"
  cp -a "${srcdir}/${_dir}/lib/." "${pkgdir}/usr/lib/${pkgname}/"
  cp -a "${srcdir}/${_dir}/java/." "${pkgdir}/usr/lib/${pkgname}/"

  cp "${srcdir}/${_dir}/install/orbbec-usb.rules" "${pkgdir}/etc/udev/rules.d/558-orbbec-usb.rules"
  echo "/usr/lib/astra-sdk" > "${pkgdir}/etc/ld.so.conf.d/astra-sdk.conf"
}

# vim:set et sw=2 sts=2:
