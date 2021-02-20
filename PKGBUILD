# Maintainer: Michał Górny <zrchos+arch@gmail.com>
# Contributor: Brandon Invergo <brandon@invergo.net>
# Contributor: juergen <juergen@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gcal
pkgver=4.1
pkgrel=3
pkgdesc="Display hybrid and proleptic Julian and Gregorian calendar sheets"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gcal/"
license=('GPL')
depends=('perl')
install=gcal.install
source=(ftp://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.xz
        https://src.fedoraproject.org/rpms/gcal/raw/rawhide/f/gcal-glibc-no-libio.patch)
md5sums=('7560189fc2393fddc920c5843b27d295'
         'a04608e34328e54e7c408a57240abfb1')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np1 -i "${srcdir}/gcal-glibc-no-libio.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
