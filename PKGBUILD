# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=cachefilesd
pkgver=0.10.10
pkgrel=2
pkgdesc="Userspace daemon acting as a backend for FS-Cache"
arch=('i686' 'x86_64' 'aarch64')
url="https://people.redhat.com/~dhowells/fscache/"
license=('GPL')
depends=('glibc')
source=(https://people.redhat.com/~dhowells/fscache/${pkgname}-${pkgver}.tar.bz2
        cachefilesd.service)
sha256sums=('0d0309851efabd02b7c849f73535b8ad3f831570e83e4f65e42354da18e11a02'
            '29a6110608dda5b13549bdf6975307151643d203455c0fd3f3707272df5850ac')
backup=(etc/cachefilesd.conf)

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS="$CFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
  install -D -m 644 README "$pkgdir/usr/share/doc/cachefilesd/README"
  install -D -m 644 "$srcdir/cachefilesd.service" "$pkgdir/usr/lib/systemd/system/cachefilesd.service"
}

# vim: ts=2:sw=2:et:nowrap
