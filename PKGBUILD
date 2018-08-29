# Maintainer: gilcu3 <gilcu3@gmail.com>
# Contributor: mortzu <me@mortzu.de>
# Contributor: David Manouchehri <d@32t.ca>
# Submitter: fluffylime <fluffylime@gmail.com>

pkgname=redsocks2-git
pkgver=0.66.r39.gc9618cd
pkgrel=1
pkgdesc='redsocks2 adapted to compile with openssl 1.0'
arch=('i686' 'x86_64')
url='https://github.com/semigodking/redsocks'
license=('GPL3')
depends=('libevent')
makedepends=('git')
conflicts=('redsocks')
provides=('redsocks2')
install=redsocks2.install
backup=('etc/conf.d/redsocks2'
        'etc/iptables/redsocks2.rules'
	'etc/redsocks2.conf')

source=("$pkgname"::'git+https://github.com/gilcu3/redsocks.git'
        'redsocks2.tmpfiles'
        'redsocks2.rules')
md5sums=('SKIP'
         '9be5e8bea768b1a8fdec55a8e8af33fd'
         '04702a7faf31d707d3df4c116bd58a6d')

pkgver() {
  cd "$pkgname"

  git describe | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/release.//g'
}

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  install -Dm644 "$srcdir/$pkgname/redsocks2.conf.example" "$pkgdir/etc/redsocks2.conf"
  install -Dm644 "$srcdir/redsocks2.rules" "$pkgdir/etc/iptables/redsocks2.rules"
  install -Dm644 "$srcdir/redsocks2.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/redsocks2.conf"

  install -Dm755 "redsocks2" "$pkgdir/usr/bin/redsocks2"
  install -Dm644 "README" "$pkgdir/usr/share/doc/redsocks2/README"
  install -Dm644 "redsocks2.service" "$pkgdir/usr/lib/systemd/system/redsocks2.service"
  install -Dm644 "redsocks2.conf.example" "$pkgdir/usr/share/doc/redsocks2/redsocks2.conf.example"
}
