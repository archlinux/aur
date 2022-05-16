# Maintainer: celeste <yuan.zx at outlook dot com>
# Contributor: yjun <jerrysteve1104 at gmail dot com>

pkgname=phddns-bin
_pkgname=${pkgname%-bin}
pkgver=5.2.0
_pkgver_aarch=5.1.0
pkgrel=1
pkgdesc="Peanut shell is a dynamic DNS software, any place, any time, any lines, all can through fixed domain access to the remote host services"
arch=("x86_64" "i686" "aarch64")
depends=('wget')
provides=("${_pkgname}" "phtunnel")
conflicts=("${_pkgname}" "phtunnel")
url="https://hsk.oray.com/download/"
license=('custom')
install='.INSTALL'
source=('LICENSE::https://service.oray.com/question/1820.html')
source_x86_64=("https://down.oray.com/hsk/linux/${_pkgname}_${pkgver}_amd64.deb")
source_i686=("https://down.oray.com/hsk/linux/${_pkgname}_${pkgver}_i386.deb")
source_aarch64=("https://dl-cdn.oray.com/hsk/linux/${_pkgname}_${_pkgver_aarch}_rapi_aarch64.deb")

sha256sums=('SKIP')
sha256sums_x86_64=('59c66efd3d623836614200ac9ff325cd1b1ec230681a0611f514784294bb8cf7')
sha256sums_i686=('e5c7c7e968bbda877f55e4d15581854ce32b014a14927c4a98bb98a4dc4b0a6e')
sha256sums_aarch64=('945963a4696d4629b1bbfd9c5555408d3fe5dde46a4b8639f33aa0830bcb0e72')

package() {
  install -dm755 ${srcdir}/${pkgname}
  tar -xf data.tar.gz -C ${srcdir}/${pkgname}

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
