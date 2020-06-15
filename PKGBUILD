# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Paul Sajna <sajattack at gmail dot com>

pkgname=fern-wifi-cracker
pkgver=3.1
pkgrel=1
groups=('blackarch' 'blackarch-cracker' 'blackarch-wireless')
pkgdesc='WEP, WPA wifi cracker for wireless penetration testing'
arch=('any')
url='https://github.com/savio-code/fern-wifi-cracker'
license=('GPL2')
depends=('gksu' 'python' 'python-pyqt5' 'aircrack-ng' 'xterm' 'subversion' 'scapy'
         'macchanger')
replaces=('fern-wifi-cracker-git')
conflicts=('fern-wifi-cracker-git')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/savio-code/fern-wifi-cracker/archive/v${pkgver}.tar.gz")
sha256sums=('94d0180798f1cd48a3bb25d35f496438ce8bc8e8c75c180c942df9308a2a35a7')

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
