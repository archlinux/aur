# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Rémy Oudompheng <remy@archlinux.org>

pkgname=cachefilesd
pkgver=0.10.5
pkgrel=1
pkgdesc="Userspace daemon acting as a backend for FS-Cache"
arch=('i686' 'x86_64')
url="http://people.redhat.com/~dhowells/fscache/"
license=('GPL')
depends=('glibc')
source=(http://people.redhat.com/~dhowells/fscache/${pkgname}-${pkgver}.tar.bz2
        cachefilesd.service)
sha256sums=('125ea4f6aef4bf8e936a7cc747b59e074537a8aed74cd1bab3f05d7fbc47287f'
            'aa889fcbc2ca59aed2be4ef586c3039ceadc6bc5969398a175a77c63ccbe11e0')
backup=(etc/cachefilesd.conf)

build() {
  cd "$pkgname-$pkgver"
  make CFLAGS="$CFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m 644 "$srcdir/cachefilesd.service" "$pkgdir/usr/lib/systemd/system/cachefilesd.service"
}

# vim: ts=2:sw=2:et:nowrap
