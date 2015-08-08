# Maintainer: Rémy Oudompheng <remy@archlinux.org>

pkgname=cachefilesd
pkgver=0.10.5
pkgrel=1
pkgdesc="Userspace daemon acting as a backend for FS-Cache"
arch=('i686' 'x86_64')
url="http://people.redhat.com/~dhowells/fscache/"
license=('GPL')
depends=('glibc')
source=(http://people.redhat.com/~dhowells/fscache/${pkgname}-${pkgver}.tar.bz2
        cachefilesd)
backup=(etc/cachefilesd.conf)
md5sums=('9e85dd0ace346ff47e188ded8c05ab3b'
         'a4f0c47a945f296f120e29f156aea9ba')

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS="$CFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m 755 "${srcdir}/cachefilesd" "${pkgdir}/etc/rc.d/cachefilesd"
}
