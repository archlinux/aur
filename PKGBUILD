# Maintainer: Luca Leon Happel (Quoteme)
# This is a fork of the original networkmanager_dmenu by
#     Scott Hansen (firecat53) firecat4153 at gmail dot com
_pkgname=networkmanager-dmenu-bluetoothfix
_gitname=networkmanager-dmenu-bluetoothfix
pkgname=$_pkgname-git
pkgver=r58.2770261
pkgrel=1
pkgdesc="Control NetworkManager via dmenu (+fix to toggle bluetooth)"
arch=('any')
url="https://github.com/Quoteme/networkmanager-dmenu-bluetoothfix"
license=('MIT')
depends=('python' 'networkmanager' 'python-gobject')
makedepends=('git')
optdepends=('dmenu: either dmenu or rofi is required'
            'rofi: either dmenu or rofi is required'
            'network-manager-applet: for the nm-connection-editor GUI')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+"https://github.com/Quoteme/${_gitname}.git")
md5sums=('SKIP')
install="$_pkgname.install"

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  echo "IMPORTANT: +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
  echo "IMPORTANT: add the following line to 'etc/sudoers':"
  echo "IMPORTANT: "
  echo "IMPORTANT: %wheel ALL=NOPASSWD:/bin/bluetooth"
  echo "IMPORTANT: "
  echo "IMPORTANT: +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
  install -Dm755 "$srcdir/$_pkgname/networkmanager_dmenu" "$pkgdir/usr/bin/networkmanager_dmenu"
  install -Dm644 "$srcdir/$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_pkgname/README.rst" "$pkgdir/usr/share/doc/$pkgname/README.rst"
  install -Dm644 "$srcdir/$_pkgname/config.ini.example" "$pkgdir/usr/share/doc/$pkgname/config.ini.example"
  install -Dm644 "$srcdir/$_pkgname/networkmanager_dmenu.desktop" "$pkgdir/usr/share/applications/networkmanager_dmenu.desktop"
}
