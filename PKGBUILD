# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

_gitname=minirc
pkgname=$_gitname-git
pkgver=120.2915396
pkgrel=1
pkgdesc="Minimalistic init script"
arch=('any')
url="https://github.com/hut/minirc"
license=('GPL2')
depends=('busybox' 'sh')
makedepends=('git')
optdepends=('eudev: udev implementation'
            'mdev: udev implementation'
            'systemd: udev implementation')
conflicts=('systemd-sysvcompat' 'sysvinit')
backup=('etc/inittab' 'etc/minirc.conf')
install=$_gitname.install
source=(git://github.com/hut/$_gitname.git)
md5sums=('SKIP')

pkgver() {
  cd $_gitname

  echo $(git rev-list --count HEAD).$(git describe --always)
}

prepare() {
  cd $_gitname

  sed -i 's./sbin/./usr/bin/.g' ./setup.sh
}

package() {
  cd $_gitname

  ROOT="$pkgdir" ./setup.sh --force

  for i in FAQ README.md screenshot.png; do
    install -Dm644 $i "$pkgdir"/usr/share/doc/$_gitname/$i
  done
}
