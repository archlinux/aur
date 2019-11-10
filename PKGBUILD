# Maintainer: willemw <willemw12@gmail.com>
# Contributor: unclesam <web _AT_ shinobi-mail _DOT_ de>

_pkgname=mintstick
pkgname=$_pkgname-git
pkgver=r198.09aa95f
pkgrel=1
pkgdesc="Format or write images to usb-sticks (Linux Mint tool)"
arch=('any')
url="https://github.com/linuxmint/mintstick"
license=('GPL')
depends=('desktop-file-utils' 'dosfstools' 'python-dbus' 'python-gobject' 'python-pyparted' 'python-xapp' 'udisks2' 'xapps')
optdepends=('dosfstools: FAT filesystems' 'e2fsprogs: Ext filesystems' 'ntfs-3g: NTFS filesystems')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::git+https://github.com/linuxmint/mintstick.git)
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

  install -d "$pkgdir/usr/share"
  cp -a share/nemo "$pkgdir/usr/share"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/kde4/apps/solid/actions"
  install -d "$pkgdir/usr/share/polkit/org.linuxmint.im.policy"
  ./install.sh
}

