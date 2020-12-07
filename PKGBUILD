pkgname=pe-bear
pkgver=0.5.2.3
pkgrel=1
pkgdesc="Freeware reversing tool for PE files"
url="https://hshrzd.wordpress.com/pe-bear/"
arch=('x86_64')
license=('custom')
depends=('qt5-base')
source=("https://github.com/hasherezade/pe-bear-releases/releases/download/${pkgver}/PE-bear_${pkgver}_x64_linux.tar.xz")
sha256sums=('4f778d3bcdce46c8fa95013863635fdfda7158747ea8c5cabf89d6955b15a7ad')

package() {
  cd "PE-bear_${pkgver}_x64_linux"
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

