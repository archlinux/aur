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

package() {
  cd $pkgname

  install -Dm644 sysconfig.btrfsmaintenance "$pkgdir/etc/default/btrfsmaintenance"

  install -dm755 "$pkgdir/"{usr/lib/systemd/system,usr/share/btrfsmaintenance}
  install -Dm755 btrfs-*.sh btrfsmaintenance-{functions,refresh-cron.sh,refresh.path} README.md "$pkgdir/usr/share/btrfsmaintenance"
  install -Dm644 *.service *.timer "$pkgdir/usr/lib/systemd/system"

  #./dist-install.sh "$pkgdir/etc/default"
}

