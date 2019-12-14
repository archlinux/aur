# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Paul Sajna <sajattack at gmail dot com>

pkgname=fern-wifi-cracker
pkgver=3.0
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
sha256sums=('b4b07f719ee91e7d3b37044cf8a8d4dabf0decce9124db4402eb27b93479252f')

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
