# Maintainer: Lin Rs <LinRs@users.noreply.github.com>
# Contributor: Anselmo L. S. Melo <anselmolsm@gmail.com>
# Contributor: mortzu <me@mortzu.de>
# Contributor: David Manouchehri <d@32t.ca>
# Submitter: fluffylime <fluffylime@gmail.com>

pkgname=redsocks
pkgver=0.5
pkgrel=3
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
	'redsocks.sysusers'
        'redsocks.rules'
        'redsocks')

sha256sums=('bbeb531d7f1986d7102f1bd6733dacce41d3f3ba7d604f1aab61c63e0ba2ee62'
            '090882eb124d30d8a009cf42983df7bed96e57b5ba6797fda50229a725407d2e'
            '91a106814e357175df925f4044d18bdc6dfe5cae8e45f9db69d26f93493b32d9'
            '165e9da4331d7b5575df2690b60647f835a1089d4059db6cc7eea078963f8c74'
            'f217ee901c04fa9f58c096e92280dc36495a319de01943c8c5611be2b81809e9'
            '2ecbb1024610381a9ba8e7e2c27d57b3fa65281a72e0d411bf46aa4978d782c2')

build() {
  cd $pkgname"-release-"$pkgver

  make
}

package() {
  cd $pkgname"-release-"$pkgver

  install -Dm644 "$srcdir/redsocks" "$pkgdir/etc/conf.d/redsocks"
  install -Dm644 "$srcdir/redsocks.conf" "$pkgdir/etc/redsocks.conf"
  install -Dm644 "$srcdir/redsocks.rules" "$pkgdir/etc/iptables/redsocks.rules"
  install -Dm644 "$srcdir/redsocks.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/redsocks.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/redsocks.conf"

  install -Dm755 "redsocks" "$pkgdir/usr/bin/redsocks"
  install -Dm644 "README" "$pkgdir/usr/share/doc/redsocks/README"
  install -Dm644 "redsocks.service" "$pkgdir/usr/lib/systemd/system/redsocks.service"
  install -Dm644 "redsocks.conf.example" "$pkgdir/usr/share/doc/redsocks/redsocks.conf.example"
}
