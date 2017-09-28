# Maintainer Paul Sajna <sajattack@gmail.com>

pkgname='fern-wifi-cracker'
pkgver='2.6'
pkgrel=1
groups=('blackarch' 'blackarch-cracker' 'blackarch-wireless')
pkgdesc='WEP, WPA wifi cracker for wireless penetration testing'
arch=('any')
url='http://code.google.com/p/fern-wifi-cracker/'
license=('GPL2')
depends=('python2' 'python2-pyqt4' 'aircrack-ng' 'xterm' 'subversion' 'scapy'
         'macchanger' 'gksu')
makedepends=('unzip')
replaces=('fern-wifi-cracker-git')
conflicts=('fern-wifi-cracker-git')
source=("https://github.com/savio-code/fern-wifi-cracker/archive/2.6.zip")
sha1sums=('SKIP')

prepare() {
  unzip $pkgver.zip
  cd "$srcdir/$pkgname-$pkgver/Fern-Wifi-Cracker"
}

package() {
  cd "$srcdir/$pkgname-$pkgver/Fern-Wifi-Cracker"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/fern-wifi-cracker/Settings"

  cp -a --no-preserve=ownership * "$pkgdir/usr/share/fern-wifi-cracker"

  cat > "$pkgdir/usr/bin/fern" << EOF
#!/bin/sh
cd /usr/share/fern-wifi-cracker
exec python2 ./execute.py "\$@"
EOF

  chmod +x "$pkgdir/usr/bin/fern"
}
