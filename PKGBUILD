# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=linux-intel-undervolt-gui
pkgname=$_pkgname-bin
pkgdesc="GUI frontend for undervolting intel CPUs on Linux (binary release)"
pkgver=1.2.0
pkgrel=2
arch=('x86_64')
url="https://github.com/lukechadwick/linux-intel-undervolt-gui"
license=('MIT')
depends=('gconf' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' 'nss' 'python-undervolt')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$url/releases/download/$pkgver/linux-intel-undervolt-gui-$pkgver.x86_64.rpm")
sha256sums=('bd238a33f0d6e7c19174e4c63585bae5110b9496adb42915118cc95c27862c58')

package() {
  # Create folders
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  # Install
  for i in 16 24 32 48 64 128 256 512 1024; do
    install -Dm644 usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
  done
  install -Dm644 usr/share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  cp -r opt/UndervoltGUI "$pkgdir/opt/UndervoltGUI"
  ln -s /opt/UndervoltGUI/linux-intel-undervolt-gui -t "$pkgdir/usr/bin"
  ln -fs /usr/lib/python3.10/site-packages/undervolt.py -t "$pkgdir/opt/UndervoltGUI/resources/app/extras"
}
