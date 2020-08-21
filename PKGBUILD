pkgname=pe-bear
pkgver=0.5.0
pkgrel=1
pkgdesc="Freeware reversing tool for PE files"
url="https://hshrzd.wordpress.com/pe-bear/"
arch=('x86_64')
license=('custom')
depends=('qt5-base')
source=("https://github.com/hasherezade/pe-bear-releases/releases/download/${pkgver}/PE-bear_${pkgver}_x64_linux.tar.xz")
sha256sums=('ef61c5b0a8aec8ea430ab48ab567498afdd420a3973fc3be97daca4e809522fc')

package() {
  cd "PE-bear_${pkgver}_x64_linux"
  install -d "${pkgdir}/bin/${pkgname}/"
  install -m644 "SIG.txt" "${pkgdir}/opt/${pkgname}/"
  install -m644 "capstone_LICENSE.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m755 "PE-bear" "${pkgdir}/opt/${pkgname}/"

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

