# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=echoping
pkgver=6.0.2
pkgrel=12
pkgdesc="tests performance of a remote host by sending HTTP, TCP and UDP requests"
arch=('x86_64')
url="http://echoping.sourceforge.net/"
license=('GPL')
depends=(libidn popt libldap)
#source=(https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
source=("https://pkgs.fedoraproject.org/repo/pkgs/echoping/echoping-$pkgver.tar.gz/991478532b56ab3b6f46ea9fa332626f/echoping-$pkgver.tar.gz"
        link-echoping-to-libm.patch)
md5sums=('991478532b56ab3b6f46ea9fa332626f'
         '3df2d0073af658579323d5f638de0289')
sha256sums=('1dfa4c45bf461b2379ff91773ed7136176e2abac9e85c26bc9654942b5155eac'
            '4406771935c43591fcb31a9bc27ec342455556dda69686ea58dcf21626d30ca2')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../link-echoping-to-libm.patch
}

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
