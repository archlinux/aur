pkgname=pe-bear-bin
pkgver=0.6.0
_qtver=5.15
pkgrel=1
pkgdesc="Freeware reversing tool for PE files"
url="https://hshrzd.wordpress.com/pe-bear/"
arch=('x86_64')
license=('custom')
depends=('qt5-base')
source=("https://github.com/hasherezade/pe-bear/releases/download/v${pkgver}/PE-bear_${pkgver}_qt${_qtver}_x64_linux.tar.xz")
sha256sums=('69f6d0a74e26311ca78c9edb487ddd6eeae22daec033f73917b2616afec7bc8c')

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

