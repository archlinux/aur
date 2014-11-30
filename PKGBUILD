# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Xilon <xilonmu@gmail.com>

pkgname=dbhub
pkgver=0.451
pkgrel=1
pkgdesc='Direct Connect hub software, based on Open DC Hub but with many enhancements'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/dbhub/'
license=('GPL')
depends=('libcap' 'openssl')
makedepends=('perl')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tbz2)
md5sums=('79cf321b521b548dabfccdb57500a8f0')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  sed -i 's/^\(ACLOCAL=.*\)-${am__api_version}\(.*\)$/\1\2/' configure
  sed -i 's/^\(AUTOMAKE=.*\)-${am__api_version}\(.*\)$/\1\2/' configure
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --enable-switch-user --enable-perl CFLAGS="$CFLAGS"
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
