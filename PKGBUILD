# Maintainer: Gabriel Laskar <gabriel at lse dot epita dot fr>
pkgname=oksh
pkgver=6.8.1
pkgrel=1
url="https://github.com/ibara/oksh/"
pkgdesc="Ported version of ksh from OpenBSD"
license=('custom: Public Domain' 'ISC' 'BSD')
depends=('glibc' 'ncurses')
arch=('i686' 'x86_64')
source=(https://github.com/ibara/oksh/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('ddd2b27b99009a4ee58ddf58da73edf83962018066ccf33b2fe1f570a00917b0')

build() {
       cd "$pkgname-$pkgver"

       ./configure --prefix=/usr --mandir=/usr/share/man/
       sed -n '/Copyright/,/PERFORMANCE/p' strtonum.c > ISC-LICENSE
       sed -n '/Copyright/,/SUCH DAMAGE./p' vis.c > BSD-LICENSE
       cat LEGAL > PUBLIC_DOMAIN-LICENSE
       make
}

package() {
       cd "$pkgname-$pkgver"

       make DESTDIR="$pkgdir/" install

       install -Dm644 ISC-LICENSE "$pkgdir/usr/share/licenses/$pkgname/ISC-LICENSE"
       install -Dm644 BSD-LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD-LICENSE"
       install -Dm644 PUBLIC_DOMAIN-LICENSE "$pkgdir/usr/share/licenses/$pkgname/PUBLIC_DOMAIN-LICENSE"
}

# vim:set ts=2 sw=2 et:
