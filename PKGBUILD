# Maintainer: willemw <willemw12@gmail.com>
# Contributor: unclesam <web _AT_ shinobi-mail _DOT_ de>

pkgname=mintstick-git
pkgver=r217.43e1194
pkgrel=1
pkgdesc="Format or write images to usb-sticks (Linux Mint tool)"
arch=('any')
url="https://github.com/linuxmint/mintstick"
license=('GPL')
depends=('dosfstools' 'python-dbus' 'python-gobject' 'python-pyparted' 'python-xapp' 'udisks2' 'xapps')
optdepends=('dosfstools: FAT filesystems' 'e2fsprogs: Ext filesystems' 'ntfs-3g: NTFS filesystems')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=($pkgname::git+$url.git)
sha256sums=('SKIP')

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

  install -dm755 "$pkgdir/usr/share"
  cp -a share/nemo "$pkgdir/usr/share"

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/kde4/apps/solid/actions"
  install -dm755 "$pkgdir/usr/share/polkit/org.linuxmint.im.policy"
  ./install.sh
}

