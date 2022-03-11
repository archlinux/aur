pkgname=pe-bear
pkgver=0.5.5.3
_qtver=5.15
pkgrel=1
pkgdesc="Freeware reversing tool for PE files"
url="https://hshrzd.wordpress.com/pe-bear/"
arch=('x86_64')
license=('custom')
depends=('qt5-base')
#https://github.com/hasherezade/pe-bear-releases/releases/download/0.5.5.3/PE-bear_0.5.5.3_x64_linux.tar.xz
#https://github.com/hasherezade/pe-bear-releases/releases/download/0.5.5.3/PE-bear_0.5.5.3_qt5.15_x64_linux.tar.xz
source=("https://github.com/hasherezade/pe-bear-releases/releases/download/${pkgver}/PE-bear_${pkgver}_qt${_qtver}_x64_linux.tar.xz")
sha256sums=('0db431858928afc372b3bcab77a61d89ad52c570bed11462e9b2a97389d649e5')

package() {
  cd "PE-bear_${pkgver}_qt${_qtver}_x64_linux"
  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 "SIG.txt" "${pkgdir}/opt/${pkgname}/"
  install -m644 "capstone_LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m755 "PE-bear" "${pkgdir}/opt/${pkgname}/"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/PE-bear" << EOF
#!/bin/sh
cd /opt/${pkgname}
./PE-bear "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/PE-bear"
}

