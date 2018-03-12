# Maintainer: Anselmo L. S. Melo <anselmolsm@gmail.com>
# Contributor: mortzu <me@mortzu.de>
# Contributor: David Manouchehri <d@32t.ca>
# Submitter: fluffylime <fluffylime@gmail.com>

pkgname=redsocks
pkgver=0.5
pkgrel=2
pkgdesc='Transparent redirector of any TCP connection to proxy using your firewall'
arch=('i686' 'x86_64')
url='http://darkk.net.ru/redsocks/'
license=('Apache')
depends=('libevent')
makedepends=('git')
conflicts=('redsocks-git')
provides=('redsocks')
install=redsocks.install
backup=('etc/redsocks.conf'
        'etc/conf.d/redsocks'
        'etc/iptables/redsocks.rules')

source=('https://github.com/darkk/redsocks/archive/release-'$pkgver'.tar.gz'
        'redsocks.conf'
        'redsocks.tmpfiles'
        'redsocks.rules'
        'redsocks')

md5sums=('bb5e9c46192dcb00be10eb688d79fce3'
         'ed8b0090ded9de0940b1cd7539c78422'
         '9be5e8bea768b1a8fdec55a8e8af33fd'
         '04702a7faf31d707d3df4c116bd58a6d'
         '165271c067ed550e9c6da4439d29c5f7')

build() {
  cd $pkgname"-release-"$pkgver

  make
}

package() {
  cd $pkgname"-release-"$pkgver

  install -Dm644 "$srcdir/redsocks" "$pkgdir/etc/conf.d/redsocks"
  install -Dm644 "$srcdir/redsocks.conf" "$pkgdir/etc/redsocks.conf"
  install -Dm644 "$srcdir/redsocks.rules" "$pkgdir/etc/iptables/redsocks.rules"
  install -Dm644 "$srcdir/redsocks.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/redsocks.conf"

  install -Dm755 "redsocks" "$pkgdir/usr/bin/redsocks"
  install -Dm644 "README" "$pkgdir/usr/share/doc/redsocks/README"
  install -Dm644 "redsocks.service" "$pkgdir/usr/lib/systemd/system/redsocks.service"
  install -Dm644 "redsocks.conf.example" "$pkgdir/usr/share/doc/redsocks/redsocks.conf.example"
}
