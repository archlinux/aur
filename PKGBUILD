# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Contributor: Kristaps Esterlins <kristaps.esterlins@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Andreas Hauser <andy-aur@splashground.de>

pkgname=silc-server
pkgver=1.1.19
pkgrel=1
pkgdesc="Secure Internet Live Conferencing server"
url="http://silcnet.org"
license=(GPL2)
arch=(i686 x86_64)
depends=('silc-toolkit')
source=("https://downloads.sourceforge.net/project/silc/silc/server/sources/$pkgname-$pkgver.tar.gz"
        "silcd.service")
sha512sums=('820bbc1942f92593822b275e74cf3ac83d40bb9a348f5cad38a7449e96e965109a960e45e48d7c47993cc0f6fa6aa82355c262d19b1c4c182cb3caef19e9fbed'
            'SKIP')
install=$pkgname.install
backup=(etc/silc/{silcd,silcalgs}.conf)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr                         \
    --sbindir=/usr/bin                    \
    --sysconfdir=/etc/silc                \
    --with-logsdir=/var/log/silc          \
    --with-silcd-pid-file=/run/silcd.pid  \
    --enable-ipv6                         \
    --enable-shared                       \
    --with-gmp                            \
    --with-iconv                          \
    ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 "$srcdir"/silcd.service "$pkgdir"/usr/lib/systemd/system/silcd.service
}

# vim: ts=2:sw=2:et:nowrap
