# Maintainer: willemw <willemw12@gmail.com>

_pkgname=btrfsmaintenance
pkgname=$_pkgname-git
pkgver=0.4.r8.gbcb4c94
pkgrel=1
pkgdesc="Btrfs maintenance scripts"
arch=('any')
url="https://github.com/kdave/btrfsmaintenance"
license=('GPL')
depends=('btrfs-progs')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
backup=('etc/default/btrfsmaintenance')
source=($pkgname::git+https://github.com/kdave/btrfsmaintenance.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

#prepare() {
#  cd $pkgname
#  sed -i 's| /usr/share| "'$pkgdir'"/usr/share|g' dist-install.sh
#}

build() {
  cd $pkgname
}

package() {
  cd $pkgname

  install -Dm644 sysconfig.btrfsmaintenance "$pkgdir/etc/default/btrfsmaintenance"

  install -dm755 "$pkgdir/"{usr/lib/systemd/system,usr/share/btrfsmaintenance/systemd}
  install -Dm755 btrfs-*.sh btrfsmaintenance* README.md "$pkgdir/usr/share/btrfsmaintenance"
  install -Dm644 *.service *.timer "$pkgdir/usr/lib/systemd/system"
  install -Dm644 *.path "$pkgdir/usr/share/btrfsmaintenance/systemd"

  #./dist-install.sh "$pkgdir/etc/default"
}

