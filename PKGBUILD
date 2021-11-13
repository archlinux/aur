# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=echoping
pkgver=6.0.2
pkgrel=10
pkgdesc="tests performance of a remote host by sending HTTP, TCP and UDP requests"
arch=('x86_64')
url="http://echoping.sourceforge.net/"
license=('GPL')
depends=(libidn popt libldap)
#source=(https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
source=("https://pkgs.fedoraproject.org/repo/pkgs/echoping/echoping-$pkgver.tar.gz/991478532b56ab3b6f46ea9fa332626f/echoping-$pkgver.tar.gz")
md5sums=('991478532b56ab3b6f46ea9fa332626f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --config-cache --with-ssl
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
