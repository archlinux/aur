# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2016.08.1
pkgrel=1
pkgdesc="Perl6 compiler for MoarVM"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
groups=('perl6')
depends=("nqp>=$pkgver")
makedepends=('perl>=5.8')
provides=('rakudo-moarvm' 'perl6')
replaces=('rakudo-moarvm')
conflicts=('rakudo-moarvm')
options=('!makeflags')
source=("http://rakudo.org/downloads/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('3edae590c7dd87dfaca821c8676c5256c19e53f93bd5fd534ae235ae5a2449d0329f0b1311b6b344ec7a258f9eeae6a78e904a02d57c49a6b32ab1914ff2ebe8')

build() {
	cd "$pkgname-$pkgver"
	perl Configure.pl --prefix=/usr --backends=moar
	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	find "$pkgdir"/usr/share/perl6/precomp -type f -exec env _pkgdir="$pkgdir" perl -pe 's/\Q$ENV{_pkgdir}//g' -i '{}' '+'
}
