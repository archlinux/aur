# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Paul Sajna <sajattack at gmail dot com>

pkgname=fern-wifi-cracker
pkgver=3.3
pkgrel=1
groups=('blackarch' 'blackarch-cracker' 'blackarch-wireless')
pkgdesc='WEP, WPA wifi cracker for wireless penetration testing'
arch=('any')
url='https://github.com/savio-code/fern-wifi-cracker'
license=('GPL2')
depends=('python' 'python-pyqt5' 'aircrack-ng' 'xterm' 'subversion' 'scapy'
         'macchanger')
replaces=('fern-wifi-cracker-git')
conflicts=('fern-wifi-cracker-git')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/savio-code/fern-wifi-cracker/archive/v${pkgver}.tar.gz")
sha256sums=('0d9d622139fc54ddd4010eba30b5d73c41382c7356a7e7a19730acd38652683c')

package() {
  cd "$srcdir/$pkgname-$pkgver/Fern-Wifi-Cracker"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/fern-wifi-cracker"

  cp -a --no-preserve=ownership * "$pkgdir/usr/share/fern-wifi-cracker"

  cat > "$pkgdir/usr/bin/fern" << EOF
#!/bin/sh
cd /usr/share/fern-wifi-cracker
exec python execute.py "\$@"
EOF

  chmod 755 "${pkgdir}/usr/bin/fern"
}
