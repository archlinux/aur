# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=falcon-sensor
pkgver=4.15.0_6003
pkgrel=1
pkgdesc="Crowdstrike Falcon Sensor daemon and kernel modules"
arch=("x86_64")
url="https://crowdstrike.com"
license=("custom")
depends=("openssl" "libnl1")
backup=("etc/logrotate.d/falcon-sensor")
source=(
  "manual://ubuntu14-ubuntu16-${pkgver/\.0_/.}.deb"
  "LICENSE"
)
sha256sums=(
  "fe6a38de757a9f264b42b8f494f1ff5d078df0272555c6be0acb80d078562b5c"
  "76dbcf8027846d9a8c2fbd9ca2a163c171bbc75161b46a24f59bf64dd44fc6e9"
)

prepare() {
  mkdir "${srcdir}/${pkgname}"
  cd "${srcdir}/${pkgname}"
  
  bsdtar -xf "${srcdir}/data.tar.xz" -C .
  
  # Remove unnecessary .deb related directory
  rm -rf "${srcdir}/${pkgname}/etc/init.d"
}

package() {
  cd "${srcdir}/${pkgname}"
  cp -r "${srcdir}/${pkgname}/"* "${pkgdir}"
  install -dm755 "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  chmod a+x "${pkgdir}/opt/CrowdStrike"
  chmod -R a+r "${pkgdir}/opt/CrowdStrike"
}
