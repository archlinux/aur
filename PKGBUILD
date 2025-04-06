# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Po-An,Yang(Antonio) <yanganto gmail.com>

set -u
pkgname=networkminer
pkgver=3.0
pkgrel=1
pkgdesc='A Network Forensic Analysis Tool for advanced Network Traffic Analysis, sniffer and packet analyzer'
arch=('any')
url='https://www.netresec.com/?page=NetworkMiner'
license=('GPL2')
depends=('mono')
_srcname="NetworkMiner_${pkgver//\./-}"
source=("${_srcname}.zip::https://www.netresec.com/?download=NetworkMiner")
sha256sums=('5d074a54e2f2f26d0a2cf5a2833ab08345f1a0eeba2bdf746835545ec23e3032')

package() {
  set -u
  install -d "${pkgdir}/opt/"
  mv "${srcdir}/${_srcname}" "${pkgdir}/opt/NetworkMiner"

  # Launcher
  install -Dm755 <(cat << EOF
#!/bin/sh
mono /opt/NetworkMiner/NetworkMiner.exe
EOF
  ) "${pkgdir}/usr/bin/Networkminer.sh"

  # Desktop file for config tool
  install -Dm644 <(cat << EOF
[Desktop Entry]
Name=Network Miner
GenericName=Packet analyser
Comment=NetworkMiner packet analyser
Exec=Networkminer.sh
Terminal=false
Type=Application
#Icon=
Categories=Application;Utility;
MimeType=application/x-executable
EOF
  ) "${pkgdir}/usr/share/applications/NetworkMiner.desktop"
  set +u
}
set +u
