# Maintainer: Gyf Ooya <gyfooya@gmail.com>
pkgname=ngircd
pkgver=27
pkgrel=1
pkgdesc="Next Generation IRC Daemon (without ident support)"
arch=('x86_64')
url="https://ngircd.barton.de/"
license=('GPL-2.0-or-later')
depends=('openssl' 'zlib')
backup=('etc/ngircd.conf')

source=("https://ngircd.barton.de/pub/ngircd/ngircd-$pkgver.tar.gz"
        "ngircd.service")
sha256sums=('fd38ef21339daf81d6af4a630ba3b2de51a1b42c181843ee77635a5a661fe73c'
            'f02e30f6864ba1130bcc85bedc44ad782687f572c06f10e0501b0ddcf532b404')

build() {
  cd "$srcdir/ngircd-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --mandir=/usr/share/man \
    --without-ident \
    --with-openssl \
    --enable-ipv6
  make
}

package() {
  cd "$srcdir/ngircd-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/ngircd.service" \
    "$pkgdir/usr/lib/systemd/system/ngircd.service"
}
