pkgname=pe-bear
pkgver=0.4.0.2
pkgrel=1
pkgdesc="Freeware reversing tool for PE files"
url="https://hshrzd.wordpress.com/pe-bear/"
arch=('x86_64')
license=('custom')
depends=('qt4')
source=("https://github.com/hasherezade/pe-bear-releases/releases/download/${pkgver}/PE-bear_${pkgver}_x64_linux.tar.xz")
sha256sums=('7ad9b0e91043fba8d7c320313fbf042eb7a503e05fb7f71bbd792cf7293711ef')

package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  install -m644 "${srcdir}/SIG.txt" "${pkgdir}/opt/${pkgname}/"
  install -m644 "${srcdir}/capstone_LICENSE.TXT" "${pkgdir}/opt/${pkgname}/"
  install -m755 "${srcdir}/PE-bear" "${pkgdir}/opt/${pkgname}/"

  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/PE-bear" << EOF
#!/bin/sh
cd /opt/${pkgname}
./PE-bear "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/PE-bear"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /opt/${pkgname}/capstone_LICENSE.TXT "${pkgdir}/usr/share/licenses/pe-bear/capstone_LICENSE.TXT"
}

