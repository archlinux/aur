# Contributor: Eric Belanger <eric@archlinux.org>
# Maintainer: Andrew Gregory <andrew.gregory.8@gmail.com>

pkgname=openrc-sysvinit
pkgdesc="Linux System V Init patched to use alternate inittab for openrc"
depends=('sysvinit')
install=sysvinit.install
pkgver=2.98
pkgrel=1
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/sysvinit"
license=('GPL')
groups=('base')
source=(http://download.savannah.nongnu.org/releases/sysvinit/sysvinit-${pkgver}.tar.xz)
md5sums=('e3254f7622ea5cf2322b1b386a98ba59')
prepare() {
  cd "$srcdir/sysvinit-${pkgver}"

  # Use /etc/openrc/inittab to avoid conflicts
  sed -i 's/\/etc\/inittab/\/etc\/openrc\/inittab/g' 'src/paths.h'
}

build() {
  cd "$srcdir/sysvinit-${pkgver}"
  make -C src init
}

package() {
  cd "$srcdir/sysvinit-${pkgver}"
  install -d "$pkgdir/usr/bin"
  install -m 755 src/init "$pkgdir/usr/bin/init-openrc"
}
