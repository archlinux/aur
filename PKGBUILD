# Maintainer: Sébastien Luttringer
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=vlan
pkgver=1.9
pkgrel=5
pkgdesc='Virtual LAN configuration utility'
arch=('x86_64')
url='https://www.candelatech.com/~greear/vlan.html'
license=('GPL')
depends=('glibc')
source=("https://www.candelatech.com/~greear/vlan/vlan.$pkgver.tar.gz")
md5sums=('5f0c6060b33956fb16e11a15467dd394')

build() {
  cd $pkgname
  # don't call clean and all on the same line with -jn (with n > 0)
  # there is a race condition, both target are launched at the same time
  # and as upstream provide target nothing is built.
  # don't use !makeflags in PKGBUILD options to not penalize building
  make clean
  make all
}

package() {
  cd $pkgname
  install -D -m755 'vconfig' "$pkgdir/usr/bin/vconfig"
  install -D -m755 'macvlan_config' "$pkgdir/usr/bin/macvlan_config"
  install -D -m644 'vconfig.8' "$pkgdir/usr/share/man/man8/vconfig.8"
}

# vim:set ts=2 sw=2 et:
