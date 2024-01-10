pkgname=pe-bear-bin
pkgver=0.6.7
_qtver=5.15
pkgrel=3
pkgdesc="Freeware reversing tool for PE files"
url="https://hshrzd.wordpress.com/pe-bear/"
arch=('x86_64')
license=('custom')
depends=('qt5-base')
conflicts=('pe-bear' 'pe-bear-git')
source=("https://github.com/hasherezade/pe-bear/releases/download/v${pkgver}/PE-bear_${pkgver}_qt${_qtver}_x64_linux.tar.xz"
"https://github.com/hasherezade/pe-bear/blob/main/SIG.txt")
sha256sums=('45dc8660698ef1e9a8dbb42c28206571018293c8f10ea0d9e550ead0f7a127b2'
            '388250860ba10b25a66137923c53f90fbf110ca65ab8c1a263b549e301d7f41a')

package() {
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

