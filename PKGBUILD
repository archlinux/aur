# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Po-An,Yang(Antonio) <yanganto gmail.com>

set -u
pkgname=networkminer
pkgver=3.1
pkgrel=1
pkgdesc='A Network Forensic Analysis Tool for advanced Network Traffic Analysis, sniffer and packet analyzer'
arch=('any')
url='https://www.netresec.com/?page=NetworkMiner'
license=('GPL2')
depends=('mono')
_srcname="NetworkMiner_${pkgver//\./-}"
source=("${_srcname}.zip::https://www.netresec.com/?download=NetworkMiner")
sha256sums=('782e3d4d0b917a5aadf59966ab7d21ab30dbd593eff14e426f2b580a2e3f89e1')

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
