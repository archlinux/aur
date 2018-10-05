# Maintainer : Christian Hofmann <chof@pfho.net>

pkgname=wifite2-git
pkgver=r279.e190794
pkgrel=1
pkgdesc="A tool to attack multiple WEP and WPA encrypted networks at the same time"
arch=(any)
url="https://github.com/derv82/wifite2"
license=('GPL')
depends=(python aircrack-ng wireless_tools net-tools)
optdepends=(macchanger wireshark-cli reaver bully cowpatty pyrit hcxdumptool hcxtools john)
makedepends=(git)
source=($pkgname::git+https://github.com/derv82/wifite2.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/wifite2
  install -D -m755 ${pkgname}/Wifite.py ${pkgdir}/usr/share/wifite2/Wifite.py
  cp -r $pkgname/wifite ${pkgdir}/usr/share/wifite2/wifite

  cat > "$pkgdir/usr/bin/wifite2" << EOF
#!/bin/sh
exec python /usr/share/wifite2/Wifite.py "\${@}"
EOF

chmod a+x "$pkgdir/usr/bin/wifite2"
}
