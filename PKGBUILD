# Maintainer: Florian "Bluewind" Pritz <flo@xssn.at>
pkgname=spampd
pkgver=2.30
pkgrel=10
pkgdesc="Spamassassin Proxy Daemon"
arch=('any')
url="http://www.worlddesign.com/index.cfm/rd/mta/spampd.htm"
license=('GPL')
depends=('perl' 'perl-net-server' 'spamassassin')
install=spampd.install
source=("http://www.worlddesign.com/Content/rd/mta/$pkgname/$pkgname-$pkgver.tar.gz"
        spampd.service perl-5.18-fixes.patch)
md5sums=('742c6f2cb75db54e59d044a8ee40445f'
         'f29bea0766c07a18f6dc0a496a79e0ac'
         '55ea1067be9e70c60b708d355b085a0a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/perl-5.18-fixes.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 spampd "$pkgdir/usr/bin/spampd"
  install -Dm644 spampd.8.gz "$pkgdir/usr/share/man/man8/spampd.8.gz"
  install -Dm644 "$srcdir/spampd.service" "$pkgdir/usr/lib/systemd/system/spampd.service"
}

# vim:set ts=2 sw=2 et:
