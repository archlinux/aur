# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=oclhashcat
_pkgname=oclHashcat
pkgver=1.37
pkgrel=3
pkgdesc="Worlds fastest password cracker with dictionary mutation engine (for AMD)"
url=('https://hashcat.net/oclhashcat')
arch=('i686' 'x86_64')
license=('custom')
depends=('catalyst-utils>=14.9' 'opencl-catalyst>=14.9')
replaces=('oclhashcat-amd')
conflicts=('oclhashcat-amd')
options=('!strip')
source=(https://hashcat.net/files/${_pkgname}-${pkgver}.7z)
sha512sums=('74d5ef5be20357e706bfbff496a60e8c2d90b33e93981bca398d04099645bef0ec8df9b77f179bb770312966f788a2fe7a486abdf9a3e7bee7b0204d2d900902')

package() {
  cd ${_pkgname}-${pkgver}
  find . \( -name "*.cmd" -o -name "*.exe" \) -print | xargs -i rm {}
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
  if [ "${CARCH}" = "x86_64" ]; then
    rm ${_pkgname}32.bin
    mv ${_pkgname}64.bin ${_pkgname}
  else
    rm ${_pkgname}64.bin
    mv ${_pkgname}32.bin ${_pkgname}
  fi
  echo -e "#!/bin/sh\n/opt/${_pkgname}/${_pkgname} \$@" > "${pkgdir}/usr/bin/${_pkgname}"
  chmod +x ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  chmod -R +r .
  cp -r . "${pkgdir}/opt/${_pkgname}"
}

# vim: ts=2 sw=2 et:
