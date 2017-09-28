# Maintainer Paul Sajna <sajattack@gmail.com>

pkgname='fern-wifi-cracker-git'
pkgver='2.6.d25e58e'
pkgrel=4
groups=('blackarch' 'blackarch-cracker' 'blackarch-wireless')
pkgdesc='WEP, WPA wifi cracker for wireless penetration testing'
arch=('any')
url='http://code.google.com/p/fern-wifi-cracker/'
license=('GPL2')
depends=('python2' 'python2-pyqt4' 'aircrack-ng' 'xterm' 'subversion' 'scapy'
         'macchanger' 'gksu')
makedepends=('git' 'sed')
replaces=('fern-wifi-cracker')
source=("git+https://github.com/savio-code/fern-wifi-cracker.git")
sha1sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname/Fern-Wifi-Cracker"

  sed -i 's|python$|python2|g' execute.py
}

package() {
  cd "$srcdir/$pkgname/Fern-Wifi-Cracker"

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
