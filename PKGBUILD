# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=cachefilesd
pkgver=0.10.9
pkgrel=1
pkgdesc="Userspace daemon acting as a backend for FS-Cache"
arch=('i686' 'x86_64')
url="https://people.redhat.com/~dhowells/fscache/"
license=('GPL')
depends=('glibc')
source=(https://people.redhat.com/~dhowells/fscache/${pkgname}-${pkgver}.tar.bz2
        cachefilesd.service)
sha256sums=('c897ec6704615f26de3ddc20ff30a191ce995cb8973d2cde88b4b28c1a1e6bca'
            'aa889fcbc2ca59aed2be4ef586c3039ceadc6bc5969398a175a77c63ccbe11e0')
backup=(etc/cachefilesd.conf)

prepare() {
  cd "$pkgname-$pkgver"
  sed -i "s#/sbin/#/usr/bin/#g" cachefilesd.{c,service}
}

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS="$CFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" SBINDIR=/usr/bin install
  install -D -m 644 "$srcdir/cachefilesd.service" "$pkgdir/usr/lib/systemd/system/cachefilesd.service"
}

# vim: ts=2:sw=2:et:nowrap
