pkgname=pe-bear
pkgver=0.5.5.7
_qtver=5.15
pkgrel=1
pkgdesc="Freeware reversing tool for PE files"
url="https://hshrzd.wordpress.com/pe-bear/"
arch=('x86_64')
license=('custom')
depends=('qt5-base')
source=("https://github.com/hasherezade/pe-bear-releases/releases/download/${pkgver}/PE-bear_${pkgver}_qt${_qtver}_x64_linux.tar.xz")
sha256sums=('651116169ed4d7bca06d401efbc03529ebd3acd19d4283cd7c9d2d63b8775afc')

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

