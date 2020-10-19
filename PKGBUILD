# Maintainer: yjun <jerrysteve1104 at gmail dot com>

pkgname=phddns-bin
_pkgname=${pkgname%-bin}
pkgver=5.0.0
_pkgver=5.0
pkgrel=2
pkgdesc="Peanut shell is a dynamic DNS software, any place, any time, any lines, all can through fixed domain access to the remote host services"
arch=("x86_64" "i686" "aarch64")
depends=('wget')
provides=("${_pkgname}" "phtunnel")
conflicts=("${_pkgname}" "phtunnel")
url="https://hsk.oray.com/download/"
license=('custom')
install='.INSTALL'
source=('LICENSE::https://service.oray.com/question/1820.html')
source_x86_64=("http://dl-cdn.oray.com/hsk/linux/${_pkgname}-${pkgver}-amd64.deb")
source_i686=("http://dl-cdn.oray.com/hsk/linux/${_pkgname}-${pkgver}-i386.deb")
source_aarch64=("https://dl-cdn.oray.com/hsk/linux/phtunnel_${_pkgver//./_}_rapi_aarch64.deb")

sha256sums=('SKIP')
sha256sums_x86_64=('f27b86a13684212b9e852a6ac20256d9fadf7ca3a402d4f4c5d70530dffd1c1c')
sha256sums_i686=('882aaca32b86d1beb3d0daf3f3bce35ff1eb7500729a3cec48ee3427fb2e8b7b')
sha256sums_aarch64=('3e7dd863442a2c62fedc343c6b0b9fd4c24c7f987a2d3392209ced3a4aba0db8')

package() {
  install -dm755 ${srcdir}/${pkgname}
  tar -xf data.tar.xz -C ${srcdir}/${pkgname}

  # binary
  install -Dm755  -t ${pkgdir}/usr/bin/ ${srcdir}/${pkgname}/usr/bin/phtunnel
  if [ $CARCH == "aarch64" ];then
    install -Dm755  -t ${pkgdir}/usr/bin/ ${srcdir}/${pkgname}/usr/bin/${_pkgname}
  else
    install -Dm755  ${srcdir}/${pkgname}/tmp/pht_script/phddns_systemd ${pkgdir}/usr/bin/${_pkgname}
  fi

  # systemd service
  if [ $CARCH == "aarch64" ];then
    install -Dm644 -t ${pkgdir}/usr/lib/systemd/system/ ${srcdir}/${pkgname}/lib/systemd/system/phtunnel.service
  else
    install -Dm644 -t ${pkgdir}/usr/lib/systemd/system/ ${srcdir}/${pkgname}/tmp/pht_script/phtunnel.service
  fi

  # license
  install -Dm644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ ${srcdir}/LICENSE
}    

# vim: ts=2 sw=2 et:  
