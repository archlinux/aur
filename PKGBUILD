# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=stallone
pkgver=0.4.0
pkgrel=1
pkgdesc="NAT-PMP server"
arch=(i686 x86_64)
url="http://tedp.id.au/stallone/"
license=(GPL2)
depends=(libcap libdaemon)
backup=("etc/stallone/natpmd.conf")
source=("http://tedp.id.au/stallone/releases/stallone-$pkgver.tar.gz"
        "stallone.service")
sha256sums=('f012f117f6191e32a6efe09aa21c6401da7268c2b65ca3df304319cede4b63b4'
            'b8d176bad85c254f97468ebafb04325492d013e799228c50c23f00c15953fabd')
validpgpkeys=('1426105B0CB343396624C524C697B70DDDD11D8A') # Ted Percival

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr               \
    --sbindir=/usr/bin          \
    --sysconfdir=/etc           \
    --with-natpmd-group=nobody  \
    ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  cd "$srcdir"
  install -D -m 644 stallone.service "$pkgdir/usr/lib/systemd/system/stallone.service"
}

# vim: ts=2:sw=2:et:ft=sh
