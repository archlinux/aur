# Maintainer Paul Sajna <sajattack@gmail.com>

pkgname='fern-wifi-cracker-git'
pkgver=2.6.14.gd25e58e
pkgrel=2
groups=('blackarch' 'blackarch-cracker' 'blackarch-wireless')
pkgdesc='WEP, WPA wifi cracker for wireless penetration testing'
arch=('any')
url='https://github.com/savio-code/fern-wifi-cracker'
license=('GPL2')
depends=('python2' 'python2-pyqt4' 'aircrack-ng' 'scapy'
         'macchanger' 'gksu')
makedepends=('git' 'sed')
replaces=('fern-wifi-cracker')
conflicts=('fern-wifi-cracker')
provides=('fern-wifi-cracker')
source=("git+https://github.com/savio-code/fern-wifi-cracker.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/fern-wifi-cracker"
  git describe --tags | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/fern-wifi-cracker/Fern-Wifi-Cracker"
}

package() {
  cd "$srcdir/fern-wifi-cracker/Fern-Wifi-Cracker"

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
