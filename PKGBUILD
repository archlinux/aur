# Maintainer: Alexander V.Buev <san@zzz.spb.ru>

pkgname=hasher-priv 
pkgrel=1
pkgver=1.6.0.alt1.r0.gfc432c2
pkgdesc="Altlinux save package build & chroot system ( private part )"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.altlinux.org/hasher"
groups=('base')
depends=('glibc' 'pam')
install=${pkgname}.install
source=(git+http://git.altlinux.org/people/ldv/packages/hasher-priv.git)
depends=('glibc')
makedepends=('help2man')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${pkgname}/${pkgname}
  patch -p0 < ../../../sbin.diff  
  make
}

check() {
  cd ${srcdir}/${pkgname}/${pkgname}
}

package() {
  cd ${srcdir}/${pkgname}/${pkgname}
  make DESTDIR=${pkgdir} install
}

