# Maintainer: Alexander V. Buev <san@zzz.spb.ru>

pkgname=pocket
pkgrel=1
pkgver=v0.2.27.r0.g6897640
pkgdesc="Pocket - hasher-priv based debian package build system"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://"
groups=('base')
depends=('hasher-priv' 'debootstrap' 'debian-archive-keyring' 'dpkg' 'rsync' )
makedepends=('help2man' 'ruby-ronn' 'autoconf' 'automake')
source=(git+https://github.com/buevsan/pocket.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${pkgname}/${pkgname}
  patch -p0 < ../../../hasher-path.diff
  autoreconf -vif
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd ${srcdir}/${pkgname}/${pkgname}
}

package() {
  cd ${srcdir}/${pkgname}/${pkgname}
  make DESTDIR=${pkgdir} install
}

