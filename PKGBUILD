# Maintainer: Antoine Lubineau <antoine@lubignon.info>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=ts
pkgver=1.0.1
pkgrel=1
_debrevision="dfsg1"
_debfullrev="dfsg1-1"
pkgdesc="A Unix batch system where the tasks spooled run one after the other"
arch=('i686' 'x86_64')
url="http://vicerveza.homeunix.net/~viric/soft/ts/"
license=('GPL2')
source=(
  "http://deb.debian.org/debian/pool/main/t/task-spooler/task-spooler_${pkgver}+${_debrevision}.orig.tar.xz"
  "http://deb.debian.org/debian/pool/main/t/task-spooler/task-spooler_${pkgver}+${_debfullrev}.debian.tar.xz"
)
md5sums=(
  '6cd744c43f36d432f303957d60474570'
  '943491a4775c81d020e12c9ba2ca42ea'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch < ../debian/patches/tsp.patch
  patch < ../debian/patches/manpage.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -D --mode=0644 TRICKS "$pkgdir/usr/share/doc/tsp/TRICKS"
}
