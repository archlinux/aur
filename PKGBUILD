# Maintainer: unclesam <web _AT_ shinobi-mail _DOT_ de>
# Contributor: willemw <willemw12@gmail.com>

_pkgname=mintstick
pkgname=$_pkgname-git
pkgver=r148.02589a6
pkgrel=1
pkgdesc="Format or write images to usb-sticks (Linux Mint tool)"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/mintstick"
license=('GPL')
depends=('python2-dbus' 'python2-gobject' 'python2-pyparted' 'udisks')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git://github.com/linuxmint/mintstick.git)
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  sed -i 's| /usr| "'$pkgdir'"/usr|g' install.sh
  sed -i 's|DATAFILES="mintstick.glade mintstick.ui"|DATAFILES="mintstick.ui"|' install.sh
}

package() {
  cd $pkgname
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/kde4/apps/solid/actions"
  install -d "$pkgdir/usr/share/polkit-1/actions"
  ./install.sh
}
