# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=osec
pkgver=1.2.5
pkgrel=1
pkgdesc="lightweight integrity checking system"
arch=(x86_64)
url="http://o-security.sourceforge.net/"
license=("GPL")
makedepends=(help2man tinycdb)
depends=(cdbxx libcap openssl perl)
install=osec.install
backup=(etc/osec/dirs.conf
	etc/osec/pipe.conf)
source=(http://downloads.sourceforge.net/project/o-security/o-security/$pkgver/osec-$pkgver.tar.gz)
md5sums=('34eb5b327affee6717e9cc589e83019f')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/osec
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/pipe.conf "$pkgdir"/etc/osec/pipe.conf
  mkdir -p "$pkgdir"/usr/share/osec
  mv "$pkgdir"/usr/share/osec.cron "$pkgdir"/usr/share/osec/
  install -d -m 0755 "$pkgdir"/var/lib/osec
}
