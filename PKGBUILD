# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=cudahashcat
_pkgname=cudaHashcat
pkgver=1.37
pkgrel=2
pkgdesc="Worlds fastest password cracker with dictionary mutation engine (for NVidia)"
url=('https://hashcat.net/oclhashcat/')
arch=('i686' 'x86_64')
license=('custom')
depends=('nvidia-utils>=346' 'opencl-nvidia>=346')
replaces=('oclhashcat-nvidia')
conflicts=('oclhashcat-nvidia')
options=('!strip')
source=(https://hashcat.net/files/${_pkgname}-${pkgver}.7z)
sha512sums=('c64eb17104e4f3d476aa4cdd3f4ee25e085e1c5ee0bd88c37dee3ad907f5a6f42cfdd7e4707f75c84e9f81c783ba2614a62deb23843a844cae4d31eb560204f1')

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
