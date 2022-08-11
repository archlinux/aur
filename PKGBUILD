# Maintainer : lsf <lsf@lsf>

pkgname=wifite2-git
pkgver=r492.29803917c
pkgrel=2
pkgdesc="A tool to attack multiple WEP and WPA encrypted networks at the same time"
arch=(any)
url="https://github.com/kimocoder/wifite2"
license=('GPL')
depends=(python aircrack-ng wireless_tools net-tools
         wireshark-cli python-argparse python-chardet)
        # scapy: listed in requirements.txt, but not actually used atm
optdepends=(macchanger reaver bully
            cowpatty pyrit hcxdumptool
            hcxtools john hashcat)
makedepends=(git)
source=($pkgname::git+https://github.com/kimocoder/wifite2.git)

sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  cd "$pkgname"
  python setup.py build
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin
}
